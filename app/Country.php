<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    /**
     * Untuk mendapatkan semua posts melalui model Country.
     * Jika table kalian mengikuti konvensi dari Laravel
     * Maka pakai yang di bawah ini
     * Konvensi tsb yaitu nama Foreign key nya user_id, post_id, dll
     * dan Primary key nya id
     */
    public function posts(){
    	//CARA Laravel
    	return $this->hasManyThrough('App\Post', 'App\User');

    	//CARA Bukan Laravel
    	// return $this->hasManyThrough(
    	//'App\Post', 'App\User', 
    	//'country_id', //foreign key di table users misalnya 
    	//'user_id');  //foreign key di table posts 
    }
}
