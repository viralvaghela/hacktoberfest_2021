package com.devgd.mycamera;

import android.app.Application;
import android.content.ContentValues;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ImageViewModel extends AndroidViewModel {
    byte[] galleryImage;
    Bitmap croppedImage;
    Bitmap imageBitmap;
    Bitmap updatedBitmap;
    ExecutorService executorService;
    List<Bitmap> undo;
    File file;
    byte[] byteArray;

    public ImageViewModel(@NonNull Application application) {
        super(application);
        executorService = Executors.newFixedThreadPool(1);
    }

    public void addUndo(List<Bitmap> undoBitmaps){
        undo=new ArrayList<>();
        undo=undoBitmaps;
    }

    public List<Bitmap> getUndoList(){
        return undo;
    }

    public void setCameraCapturedImage(byte[] byteArray){
        galleryImage=byteArray;
    }

    public Bitmap getFinalEditedBitmap(){
        if(updatedBitmap==null){
            return imageBitmap;
        }
        return updatedBitmap;
    }

    public void setGalleryImage(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteBuffer = new ByteArrayOutputStream();
        int bufferSize = 1024;
        galleryImage= new byte[bufferSize];

        int len = 0;
        while ((len = inputStream.read(galleryImage)) != -1) {
            byteBuffer.write(galleryImage, 0, len);
        }
        galleryImage=byteBuffer.toByteArray();
    }

    public byte[] getGalleryImage() {
        return galleryImage;
    }

    public Bitmap getCroppedImage(Uri uri){
        try {
            croppedImage= MediaStore.Images.Media.getBitmap(getApplication().getContentResolver(), uri);
            updatedBitmap=croppedImage;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return croppedImage;
    }

    public Bitmap getImageBitmap(byte[] byteArray){
        if(updatedBitmap==null) {
            imageBitmap = BitmapFactory.decodeByteArray(byteArray, 0, byteArray.length);
            return imageBitmap;
        }
        return updatedBitmap;

    }

    public Bitmap getUpdatedBitmap(){
        return updatedBitmap;
    }

    public void UpdatedBitmap(Bitmap bitmap){
        updatedBitmap=bitmap;
    }

    public Uri getImageUri(Bitmap inImage) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        inImage.compress(Bitmap.CompressFormat.JPEG, 100, bytes);
        String path = MediaStore.Images.Media.insertImage(getApplication().getContentResolver(), inImage, "Title", null);
        return Uri.parse(path);
    }

    public byte[] bitmapToByteArray(Bitmap bmp){
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.PNG, 100, stream);
        byteArray= stream.toByteArray();
        return byteArray;
    }

    void saveToGallery() throws IOException {

        executorService.execute(new Runnable() {
            @Override
            public void run() {
        file = new File(Environment.getExternalStorageDirectory()+"/"+ UUID.randomUUID().toString()+".jpg");
        OutputStream outputStream = null;
        try{
            outputStream = new FileOutputStream(file);
            outputStream.write(byteArray);
            updatedBitmap=BitmapFactory.decodeByteArray(byteArray, 0, byteArray.length);
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if(outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                addImageToGallery(file.getAbsolutePath(),getApplication());
            }
        }
            }

        });

    }

    public static void addImageToGallery(final String filePath, final Context context) {
        ContentValues values = new ContentValues();
        values.put(MediaStore.Images.Media.DATE_TAKEN, System.currentTimeMillis());
        values.put(MediaStore.Images.Media.MIME_TYPE, "image/jpeg");
        values.put(MediaStore.MediaColumns.DATA, filePath);
        context.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
    }
}
