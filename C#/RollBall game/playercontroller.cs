using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using TMPro;

public class playercontroller : MonoBehaviour
{
    public float speed;
    public TextMeshProUGUI countText;
    public GameObject winTextObject;
    public AudioSource collect;
    public GameObject particles;

    private Rigidbody rb;

    private float movementX;
    private float movementY;
    private int count;



    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        collect = GetComponent<AudioSource>();
        
        count=0;
        winTextObject.SetActive(false);
        particles.SetActive(false);
        SetCountText();

        
    }

    

    private void FixedUpdate()
    {
        Vector3 movement = new Vector3(movementX, 0.0f, movementY);

        rb.AddForce(movement * speed);
    }

    
    void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.CompareTag("PickUp"))
        {
           other.gameObject.SetActive(false);
           collect.Play();
           count=count+1;
           SetCountText();
        }

    }

    private void OnMove(InputValue value)
    {
        Vector2 v = value.Get<Vector2>();

        movementX = v.x;
        movementY = v.y;
    }

    void SetCountText()
    {
        countText.text = "Count: " + count.ToString();

        if (count >= 13) 
        {   
            winTextObject.SetActive(true);
            particles.SetActive(true);
            GameObject ob = Instantiate(particles);
            Destroy(ob, 2.5f);
        }
    }

    
}