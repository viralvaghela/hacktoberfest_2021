package com.example.magneticcomposs;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
public class MainActivity extends AppCompatActivity{
    SensorManager sensorManager;
    Sensor accelerometer_sensor,magnetic_field_sensor;
    ImageView needle;
    float accelerometer_data[]=new float[3];
    float magnetic_field_data[]=new float[3];
    float orientation_matrix[]=new float[3];
    float rotation_matrix[]=new float[9];
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        needle=findViewById(R.id.needle);
        sensorManager=(SensorManager)getSystemService(Context.SENSOR_SERVICE);
        accelerometer_sensor=sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        magnetic_field_sensor=sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
        SensorEventListener eventListener=new SensorEventListener() {
            @Override
            public void onSensorChanged(SensorEvent event) {
                accelerometer_data=event.values;
                SensorManager.getRotationMatrix(rotation_matrix, null, accelerometer_data, magnetic_field_data);
                SensorManager.getOrientation(rotation_matrix, orientation_matrix);
                needle.setRotation((float) (-orientation_matrix[0]*180/3.14159));
            }
            @Override
            public void onAccuracyChanged(Sensor sensor, int accuracy) {
            }
        };
        SensorEventListener listener=new SensorEventListener() {
            @Override
            public void onSensorChanged(SensorEvent event) {
                magnetic_field_data=event.values;
                SensorManager.getRotationMatrix(rotation_matrix, null, accelerometer_data, magnetic_field_data);
                SensorManager.getOrientation(rotation_matrix, orientation_matrix);

                needle.setRotation((float) (-orientation_matrix[0]*180/3.14159));
            }
            @Override
            public void onAccuracyChanged(Sensor sensor, int accuracy) {
            }
        };
        sensorManager.registerListener(eventListener, accelerometer_sensor, SensorManager.SENSOR_DELAY_NORMAL);
        sensorManager.registerListener(listener, magnetic_field_sensor, SensorManager.SENSOR_DELAY_NORMAL);
    }

}