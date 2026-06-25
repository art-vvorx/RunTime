 using System;
 using System.Collections;
 using System.Collections.Generic;
 using UnityEngine;
 using UnityEngine.EventSystems;

 


public class MoveGG : MonoBehaviour, IBeginDragHandler, IDragHandler {
	
	public GameObject ball;
	
	public GameObject ball_blue;
	
	public GameObject ball_crown;
	
	public GameObject soccer;
	
	public GameObject star;
	
	public GameObject batterfly;
	
	private GameObject player;
	
	private AudioSource audioSource;
	
	private string check_key;
	
	
	private void Start() {
		
		audioSource = GetComponent<AudioSource>();
		
		check_key = PlayerPrefs.GetString("SavesSkins");
		 
		if (check_key == "SkinBall") {
			 player = Instantiate(ball);
		}
		 
		if (check_key == "SkinBallBlue") {
			 player = Instantiate(ball_blue);
		}
		 
		if (check_key == "SkinBallCrown") {
			 player = Instantiate(ball_crown);
		}
		 
		if (check_key == "SkinSoccer") {
			 player = Instantiate(soccer);
		}
		 
		if (check_key == "SkinStar") {
			 player = Instantiate(star);
		}
		
		if (check_key == "SkinBatterfly") {
			 player = Instantiate(batterfly);
		}		
		 
		if (check_key == "") {
			player = Instantiate(ball);
		}
	}
	
	public void OnBeginDrag (PointerEventData eventData) {
		
        if (!GameOver.lose) {
						
			if((Mathf.Abs(eventData.delta.x)) > (Mathf.Abs(eventData.delta.y))) {
				audioSource.Play();
				if (eventData.delta.x > 0) 
					if(player.transform.position.x > 1.0f) 
						player.transform.position = new Vector2 (player.transform.position.x + 0, player.transform.position.y);
					
					else {
						player.transform.position = new Vector2 (player.transform.position.x + 1.5f, player.transform.position.y);
						player.transform.localScale = new Vector2 (- 0.55f, player.transform.localScale.y);
					}
					
				else 
					if(player.transform.position.x < -1.0f) 
						player.transform.position = new Vector2 (player.transform.position.x + 0, player.transform.position.y);
					else {
						player.transform.position = new Vector2 (player.transform.position.x - 1.5f, player.transform.position.y);
						player.transform.localScale = new Vector2 (0.55f, player.transform.localScale.y);
					}
			}		

        }
	
	}
	
	public void OnDrag(PointerEventData eventData) {
	
	}
	
    
}
