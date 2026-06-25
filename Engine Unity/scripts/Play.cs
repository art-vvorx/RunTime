using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Play : MonoBehaviour {
	
	public GameObject play_btn_pressed;


	public void OnMouseDown () {
		
		play_btn_pressed.SetActive(true);
		
		StartCoroutine(Wait(0.13f));
	}
	
	
	private IEnumerator Wait(float seconds) {
		
		yield return new WaitForSeconds(0.13f);
		
		SceneManager.LoadScene("main",LoadSceneMode.Single);
	}
		
		
}