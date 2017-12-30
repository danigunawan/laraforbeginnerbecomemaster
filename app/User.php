<?php

namespace App;
use App\Post;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function kepost(){
        return $this->hasOne('App\Post'); # jika tidak menggunakan use App\Post;
        // return $this->hasOne(Post::class, 'user_id') # jika menggunakan use App\Post;
    }


    public function posts(){
        return $this->hasMany('App\Post');
    }

    public function roles(){
        return $this->belongsToMany('App\Role')->withPivot('created_at');

        // to costumize tables name and columns follow format below
         // return $this->belongsToMany('App\Role', 'user_roles', 'user_id', 'role_id');
    }

    public function photos(){
        return $this->morphMany('App\Photo', 'imageable');
    }

}
