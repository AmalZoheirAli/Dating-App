import { Component, OnInit, Input } from '@angular/core';
import { UserService } from 'src/app/_services/User.service';
import { Identifiers } from '@angular/compiler';
import { User } from 'src/app/_models/User';
import { AlertifyService } from 'src/app/_services/alertify.service';
import { ActivatedRoute } from '@angular/router';
import { SelectMultipleControlValueAccessor } from '@angular/forms';
import { NgxGalleryAction, NgxGalleryOptions, NgxGalleryImage, NgxGalleryAnimation } from 'ngx-gallery';
import { FLAGS } from '@angular/core/src/render3/interfaces/view';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';

@Component({
  selector: 'app-member-detials',
  templateUrl: './member-detials.component.html',
  styleUrls: ['./member-detials.component.css']
})
export class MemberDetialsComponent implements OnInit {
  user: User;
  galleryOptions: NgxGalleryOptions[];
  gallaryImages: NgxGalleryImage[];
  constructor(private userService: UserService, private alertify: AlertifyService,private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.data.subscribe(data => {
      this.user = data['user'];
    });
    this.galleryOptions = [
      {
          width: '500px',
          height: '500px',
          imagePercent: 100,
          thumbnailsColumns: 4,
          imageAnimation: NgxGalleryAnimation.Slide,
          preview: false
      }];
      this.gallaryImages = this.getImages();


  }
  getImages() {
    const imageUrl=[];
    for(let i = 0; i<this.user.photos.length; i++){
      imageUrl.push(
        {
          small: this.user.photos[i].url,
          medium: this.user.photos[i].url,
          big: this.user.photos[i].url,
          description: this.user.photos[i].description,
        }
      );
    }
    return imageUrl;
  }
}
