import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {FormsModule} from '@angular/forms';
import { JwtModule } from '@auth0/angular-jwt';
import { NgxGalleryModule } from 'ngx-gallery';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { NavComponent } from './nav/nav.component';
import { from } from 'rxjs';
import { HomeComponent } from './Home/Home.component';
import {BsDropdownModule, TabsModule} from 'ngx-bootstrap';
import { RegisterComponent } from './register/register.component';
import {ErrorInterceptorProvider} from './_services/error.interceptor';
import { AlertifyService } from './_services/alertify.service';
import { ListsComponent } from './lists/lists.component';
import { MemberListComponent } from './members/member-list/member-list.component';
import { MessagesComponent } from './messages/messages.component';
import { RouterModule } from '@angular/router';
import { appRoutes } from './routes';
import { AuthGuard } from './_gaurds/auth.guard';
import { UserService } from './_services/User.service';
import { MemberCardComponent } from './members/member-card/member-card.component';
import { MemberDetialsComponent } from './members/member-detials/member-detials.component';
import {MemberDetialResolver} from './_resolver/MemberDetialsResolver';
import { MemberListResolver } from './_resolver/MemberListResolver';
import { MemberEditComponent } from './members/member-edit/member-edit.component';
import { MemberEditResolver } from './_resolver/MemberEditResolver.1';
export function tokenGetter(){
  return localStorage.getItem('token');
}
@NgModule({
   declarations: [
      AppComponent,
      NavComponent,
      HomeComponent,
      RegisterComponent,
      ListsComponent,
      MemberListComponent,
      MessagesComponent,
      MemberCardComponent,
      MemberDetialsComponent,
      MemberEditComponent
   ],
   imports: [
      BrowserModule,
      AppRoutingModule,
      HttpClientModule,
      FormsModule,
      BsDropdownModule.forRoot(),
      TabsModule.forRoot(),
      NgxGalleryModule,
      RouterModule.forRoot(appRoutes),
      JwtModule.forRoot({
        config:{
          tokenGetter: tokenGetter,
          whitelistedDomains: ['localhost:5000'],
          blacklistedRoutes: ['localhosst:5000/api/auth']
        }
     })
   ],
   providers: [
      ErrorInterceptorProvider,
      AlertifyService,
      AuthGuard,
      UserService,
      MemberDetialResolver,
      MemberListResolver,
      MemberEditResolver
   ],
   bootstrap: [
      AppComponent
   ]
})
export class AppModule { }
