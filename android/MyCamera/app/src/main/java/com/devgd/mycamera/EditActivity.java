package com.devgd.mycamera;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.ViewModelProvider;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import android.graphics.Matrix;

import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;

import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import com.theartofdev.edmodo.cropper.CropImage;
import com.theartofdev.edmodo.cropper.CropImageView;

import java.io.ByteArrayOutputStream;
import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import java.util.ArrayList;

import java.util.List;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


import static com.devgd.mycamera.TakePicture.EditConstant;

public class EditActivity extends AppCompatActivity {

    ImageView captureImage;
    byte[] byteArray;
    Bitmap bmp;
    ExecutorService executorService = Executors.newFixedThreadPool(1);
    List<Bitmap> undo;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit);
        captureImage=findViewById(R.id.capturedImage);

        byteArray = MainActivity.imageViewModel.getGalleryImage();
        bmp = MainActivity.imageViewModel.getImageBitmap(byteArray);
        captureImage.setImageBitmap(bmp);
        if(MainActivity.imageViewModel.getUndoList()==null) {
            undo=new ArrayList<>();
        }
        else{
            undo=MainActivity.imageViewModel.getUndoList();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == CropImage.CROP_IMAGE_ACTIVITY_REQUEST_CODE) {
            CropImage.ActivityResult result = CropImage.getActivityResult(data);
            if (resultCode == RESULT_OK) {
                bmp=MainActivity.imageViewModel.getCroppedImage(result.getUri());
                captureImage.setImageBitmap(bmp);
                Toast.makeText(this, "Cropping successful, Sample: ", Toast.LENGTH_SHORT).show();
            } else if (resultCode == CropImage.CROP_IMAGE_ACTIVITY_RESULT_ERROR_CODE) {
                Toast.makeText(this, "Cropping failed: " + result.getError(), Toast.LENGTH_LONG).show();
            }
        }
    }

    public void crop(View view) {
        Toast.makeText(this, "Crop", Toast.LENGTH_SHORT).show();
        cropImage(MainActivity.imageViewModel.getImageUri(bmp));
        undo.add(bmp);
        MainActivity.imageViewModel.addUndo(undo);
    }

   public void cropImage(Uri uri){
        try {
            CropImage.activity(uri)
                    .setGuidelines(CropImageView.Guidelines.ON)
                    .setMultiTouchEnabled(true)
                    .setAllowRotation(false)
                    .start(this);
        }catch (Exception e){
            e.printStackTrace();
        }
   }

    public void rotate(View view) {
        Toast.makeText(this, "Rotate", Toast.LENGTH_SHORT).show();
        rotateImage();
    }
    public void rotateImage(){
        executorService.execute(() -> {
            Bitmap bInput =bmp;
            float degrees = 90;
            Matrix matrix = new Matrix();
            matrix.setRotate(degrees);
            undo.add(bmp);
            MainActivity.imageViewModel.addUndo(undo);
            bmp = Bitmap.createBitmap(bInput, 0, 0, bInput.getWidth(), bInput.getHeight(), matrix, true);
            EditActivity.this.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    captureImage.setImageBitmap(bmp);
                    MainActivity.imageViewModel.UpdatedBitmap(bmp);
                }
            });
        });

    }

    public void undo(View view) {
        Toast.makeText(this, "Undo", Toast.LENGTH_SHORT).show();
        performUndo();
    }

    public void performUndo() {
        int lastPosition;
        if (undo.size() > 0) {
            if (undo.size() > 1) {
                lastPosition = undo.size() - 1;
            } else {
                lastPosition = 0;
            }
            captureImage.setImageBitmap(undo.get(lastPosition));
            bmp = undo.get(lastPosition);
            MainActivity.imageViewModel.UpdatedBitmap(bmp);
            undo.remove(lastPosition);
            MainActivity.imageViewModel.addUndo(undo);
        }
    }

    public void save(View view) {
        try {
            byteArray=MainActivity.imageViewModel.bitmapToByteArray(bmp);
            MainActivity.imageViewModel.saveToGallery();
            Toast.makeText(this, "Image Saved to Gallery!", Toast.LENGTH_SHORT).show();
            Intent finalIntent=new Intent(getApplicationContext(),MainActivity.class);
            startActivity(finalIntent);
            finish();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}