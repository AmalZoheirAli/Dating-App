import { Routes } from '@angular/router';
import { HomeComponent } from './Home/Home.component';
import { MemberListComponent } from './members/member-list/member-list.component';
import { MessagesComponent } from './messages/messages.component';
import { ListsComponent } from './lists/lists.component';
import { AuthGuard } from './_gaurds/auth.guard';
import { MemberDetialsComponent } from './members/member-detials/member-detials.component';
import { MemberDetialResolver } from './_resolver/MemberDetialsResolver';
import { MemberListResolver } from './_resolver/MemberListResolver';
import { MemberEditComponent } from './members/member-edit/member-edit.component';
import { MemberEditResolver } from './_resolver/MemberEditResolver.1';

export const appRoutes: Routes =[
{path : '', component : HomeComponent},
{
    path: '',
    runGuardsAndResolvers : 'always',
    canActivate:[AuthGuard],
    children:[
        {path : 'members', component : MemberListComponent,
        resolve: {users: MemberListResolver}},
        {path: 'member/edit', component: MemberEditComponent,
        resolve: {user: MemberEditResolver}},
        {path : 'members/:id', component : MemberDetialsComponent,
         resolve: {user: MemberDetialResolver}},
        {path : 'messages', component : MessagesComponent},
        {path : 'lists', component : ListsComponent}
    ]

},
{path : '**', redirectTo : '', pathMatch : 'full'},
];
