using UnityEngine;

public class MoveDown : MonoBehaviour {


    private float Speed = 7f; 
	
	
	void Update() {
		
		transform.position -= new Vector3 (0, Speed * Time.deltaTime, 0);
		
	}
	
	
	void FixedUpdate() {
		
		if (transform.position.y < -8) {
			
			Destroy(gameObject);
			
		}
		
	}
	
	
}
