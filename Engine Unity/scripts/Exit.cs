using UnityEngine;
using System.Collections;

public class Exit : MonoBehaviour {
	
	public GameObject exit_btn_pressed;

	public void OnMouseDown () {
		
		exit_btn_pressed.SetActive(true);
		
		StartCoroutine(Wait(0.13f));
	}
	
	
	private IEnumerator Wait(float seconds) {
		
		yield return new WaitForSeconds(0.13f);
		exit_btn_pressed.SetActive(false);
		Application.Quit();
    }
}