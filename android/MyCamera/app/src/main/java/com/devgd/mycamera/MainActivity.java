package com.devgd.mycamera;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.lifecycle.ViewModelProvider;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import static com.devgd.mycamera.TakePicture.EditConstant;

public class MainActivity extends AppCompatActivity {

    static final int Permission_code=1;
    static final int Permission_code_for_write=101;
    static final int Pick_Image=11;
    Uri uri;
    static ImageViewModel imageViewModel;
    ImageView finalEditedImage;
    Bitmap finalBitmap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        if(ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE)!= PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, Permission_code_for_write);
        }
        AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);
        if(imageViewModel==null) {
            imageViewModel = new ViewModelProvider(this, ViewModelProvider.AndroidViewModelFactory.
                    getInstance(this.getApplication())).get(ImageViewModel.class);
        }

        finalEditedImage=findViewById(R.id.processedImage);
        finalBitmap=imageViewModel.getFinalEditedBitmap();

        if(finalBitmap!=null){
            finalEditedImage.setImageBitmap(finalBitmap);
        }
    }

    public void takePicture(View view) {
        if(ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA)== PackageManager.PERMISSION_GRANTED ){
            if(ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE)== PackageManager.PERMISSION_GRANTED){
                Granted();
            }
            else {
                ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, Permission_code_for_write);
            }

        }
        else{
            RequestPer();
        }
    }

    public void openGallery(View view) {
        if(ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)== PackageManager.PERMISSION_GRANTED) {
            chooseImage();
        }
        else {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, Permission_code_for_write);
        }
    }

    private void RequestPer() {
        ActivityCompat.requestPermissions(this,new String[]{Manifest.permission.CAMERA},Permission_code);
    }

    private void Granted() {
        Intent pictureIntent = new Intent(getApplicationContext(),TakePicture.class);
        startActivity(pictureIntent);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == Permission_code) {
            if (permissions.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Granted();
            }
        }
    }
    public void chooseImage(){
        Intent intent=new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);
        startActivityForResult(intent,Pick_Image);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode==Pick_Image && resultCode==RESULT_OK
                && data!=null && data.getData()!=null){
            uri=data.getData();
            InputStream iStream = null;
            try {
                iStream = getContentResolver().openInputStream(uri);
                imageViewModel.setGalleryImage(iStream);
                byte[] byteArray = imageViewModel.getGalleryImage();
                Intent editIntent=new Intent(getApplicationContext(),EditActivity.class);
                startActivity(editIntent);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }
}