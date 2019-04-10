import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-Home',
  templateUrl: './Home.component.html',
  styleUrls: ['./Home.component.css']
})
export class HomeComponent implements OnInit {
  registermode = false;
  constructor(private http: HttpClient) { }

  ngOnInit() {
  }
  registerToggle() {
    this.registermode = true;
  }

  cancelRegisterMode(registermode: boolean){
    debugger;
    this.registermode = registermode;
  }
}
