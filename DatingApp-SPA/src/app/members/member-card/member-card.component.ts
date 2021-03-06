import { Component, OnInit, Input } from '@angular/core';
import { User } from 'src/app/_models/User';
import { Photo } from 'src/app/_models/Photo';
import { UserService } from 'src/app/_services/User.service';


@Component({
  selector: 'app-member-card',
  templateUrl: './member-card.component.html',
  styleUrls: ['./member-card.component.css']
})
export class MemberCardComponent implements OnInit {

  @Input() user: User;
  constructor() { }

  ngOnInit() {
  }

}
