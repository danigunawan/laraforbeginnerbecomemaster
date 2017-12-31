<?php
use App\Country;
use App\Post;
use App\User;
use App\Photo;
use App\Tag;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::get('post','PostController@index');

// Route::resource('posts', 'PostController');
// Route::get('contact', 'PostsController@contact');
// Route::get('post/{id}/{name}/{password}', 'PostsController@show_post');


//##### DATABASE RAW QUERIES ########### //

// use Illuminate\Support\Facades\DB;

Route::get('insert', function(){
	DB::insert('insert into posts(title, content) values(?, ?)', ['PHP With Laravel', 'Laravel  is the best things that has happened to PHP']); // DB:: ini static method bawaan laravel untuk raw query insert adalah classnya
});


Route::get('read', function(){
	$results = DB::select('select * from posts where id = ?', [1]);
	return var_dump($results);
	// foreach ($results as $key => $post) {
	// 	return $post->title;
	// }
});

Route::get('/update', function(){
	$updated = DB::update('update posts set title="Update Title" where id = ?', [1]);
	return $updated;
});

Route::get('delete', function(){
	$deleted = DB::delete('delete from posts where id = ?', [1]);
	return $deleted;
});


//##### DATABASE ORM ELOQUENT ########### //

Route::get('/read', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;

	$posts = Post::all(); # jika pakai use App\Post;

	foreach ($posts as $key => $post) {
		return $post->title;
	}

});


Route::get('/find', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	$post = Post::find(1); # jika pakai use App\Post;

	return $post->title;


});

//Read Finding With Constraints
Route::get('/findwhere', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	$posts = Post::where('id', 2)->orderBy('id', 'desc')->take(1)->get(); # jika pakai use App\Post;

	return $posts;


});

Route::get('/findmore', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	$posts = Post::findOrFail(1); # jika pakai use App\Post;

	return $posts;


});


// Fungsi ORM lainnya
//$posts = Post::where('users_count', '<', 50)->firstOrFail();

//## ORM CRUD ## //

//Insert
Route::get('/basicinsert', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	$post = new Post; # jika pakai use App\Post;
	$post->title = 'New Eloquent Title Insert';
	$post->content = 'Wow Eloquent dahsyat content';
	$post->save();
});


//Insert by id
Route::get('/basicinsertbyid', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	$post = Post::find(1); # jika pakai use App\Post;
	$post->title = 'New Eloquent Title Insert';
	$post->content = 'Wow Eloquent dahsyat content';
	$post->save();
});


## 052-creating-data-and-configuring-mass-assignment
## CREATE
Route::get('/create', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::create(['title' => 'the create method', 'content' => 'wow I\'am learning alot dani']); # jika pakai use App\Post;

});


## UPDATE
Route::get('/update', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::where('id', 2)->where('is_admin', 0)->update(['title' => 'NEW PHP TITLE', 'content' => 'i love my instructure dani']); # jika pakai use App\Post;

});


## DELETE
Route::get('/delete', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	$post = Post::find(1); # jika pakai use App\Post;
	$post->delete();
});

## DELETE V2 = DESTROY
Route::get('/delete2', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::destroy(2); # jika pakai use App\Post;
	
});

## DELETE V3 = DESTROY BEBERAPA ID YANG DIPILIH DALAM KASUS INI ID 4 DAN 5 keduanya terhapus

Route::get('/delete3', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::destroy([4,5]); # jika pakai use App\Post; 

	// Post::where('is_admin', 0)->delete();
	
});


// SOFT DELETES

Route::get('/softdelete', function(){

	Post::find(8)->delete();

});


// READ SOFTDELETES
Route::get('/readsoftdelete', function(){

	// $post = Post::find(7);
	// return $post;
	$post = Post::withTrashed()->where('id',7)->get();
	return $post;
});

// READ SOFTDELETES V2 MENAMPILKAN SELURUH DATA YANG TRASHED/SOFTDELETES (ONLYTRASHED)
Route::get('/readsoftdeleteonlytrashed', function(){

	// $post = Post::find(7);
	// return $post;
	$post = Post::onlyTrashed()->where('is_admin', 0)->get();
	return $post;
});


## VERSI 3
// READ SOFTDELETES V3 WHERE CONDITION 
// kondisi ini data akan tampil ketika pertama kali create data, field/kolom deleted_at akan NULL dan belum digunakan untuk soft delete 
// maka berlaku kondisi fungsi dibawah ini

Route::get('/readsoftdeletev3', function(){

	// $post = Post::find(7);
	// return $post;
	$post = Post::withTrashed()->where('is_admin', 0)->get();
	return $post;
});


// RESTORE SEMUA DATA SOFT DELETES KONDISI is_admin = 0
Route::get('/restoresoftdeletes', function(){

	// $post = Post::find(7);
	// return $post;
	$post = Post::withTrashed()->where('is_admin', 0)->restore();
	return $post;
});



// RESTORE  DATA SOFT DELETES BY ID
Route::get('/restoresoftdeletesbyid', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	$post = Post::withTrashed()->where('is_admin', 0)->where('id',7)->restore();
	return $post;
});

// FORCE DELETE YAITU MENDELETE PERMANEN DATA WALAUPUN MENGGUNAKAN FUNGSI SOFT DELETES
// SEMUA DATA DIDELETES berdasarkan is_admin = 0
Route::get('/forcedelete', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::withTrashed()->where('is_admin', 0)->forceDelete();
});

// FORCE DELETE BY ID
Route::get('/forcedeletebyid', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::withTrashed()->where('is_admin', 0)->where('id',8)->forceDelete();
});


//FORCE DELETE onlyTrashed by is_admin = 0
Route::get('/forcedeleteonlytrashed', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::onlyTrashed()->where('is_admin', 0)->forceDelete();
});


## ELOQUENT RELATIONSHIPS HASONE HASMANY MANY TO MANY

#HASONE (ONE TO ONE RELATIONSHIP)
Route::get('/user/post/{id}', function($id){
	return User::find($id)->kepost;
	// return User::find($id)->kepost->title;
});

# INVERSE RELATIONSHOP HAS ONE
Route::get('/post/{id}/user', function($id){
	return Post::find($id)->user->name;

});


#HASMANY (ONE TO MANY RELATIONSHIP)
Route::get('/posts', function(){
	$user = User::find(1);

	foreach ($user->posts as $key => $post) {
		return $post->title . "<br>";
	}
});


##MANY TO MANY RELATIONSHIPS

# V1 - STATIS
Route::get('/user/{id}/role', function($id){
	$user = User::find($id)->roles()->orderBy('id','desc')->get();

	return $user;

});

##MANY TO MANY RELATIONSHIPS
# V2 - DINAMIS
Route::get('/user/{id}/roledinamis', function($id){
	$user = User::find($id);

	foreach ($user->roles as $key => $role) {
		return $role->name . "<br>";
	}
});


##MANY TO MANY RELATIONSHIPS
# V3 - DINAMIS ARRAY GET

Route::get('/user/{id}/roledinamisarray', function($id){
	$user = User::find($id)->roles()->orderBy('id','desc')->get();

	return $user;

});


// Part 66 66-querying-intermediate-table.txt
// ACCESING the Intermediate table / pivot

# PIVOT ACCESS V1
Route::get('/user/pivot', function(){
	$user = User::find(1);

	foreach ($user->roles as $key => $role) {
		return  $role->pivot;
	}
});

# PIVOT ACCESS V2 CREATED_AT
Route::get('/user/pivot2', function(){
	$user = User::find(1);

	foreach ($user->roles as $key => $role) {
		return  $role->pivot->created_at;
	}
});


## HAS MANY THROUGH RELATIONS

Route::get('/user/country', function(){
//Untuk mendapatkan semua posts melalui model Country.
$country = Country::find(1);

foreach ($country->posts as $key => $post) {
	# code...
	return $post->title;
}

});


## POLYMORPHIC RELATIONS
# setiap user dan post punya photo

# USER POLYMORPHIC
Route::get('user/photos', function(){
$users = User::find(1);
foreach ($users->photos as $key => $photo) {
	# code...
	// return $photo;
	return $photo->path;
}
});


#POST POLYMORPHIC
Route::get('user/posts', function(){
$posts = Post::find(2); # dari imageable_type = App\Post dan imageable_id = 2
foreach ($posts->photos as $key => $post) {
	# code...
	// return $post;
	// return $post->path;
	echo $post->path . "<br>";
}
});



#POST POLYMORPHIC DINAMIS
Route::get('user/{id}/posts', function($id){
$posts = Post::find($id); # dari imageable_type = App\Post dan imageable_id = 2
foreach ($posts->photos as $key => $post) {
	# code...
	// return $post;
	// return $post->path;
	echo $post->path . "<br>";
}
});


#POLYMORPHIC DINAMIS RELATION THE INVERSE
Route::get('user/{id}/post', function($id){
$photo = Photo::findOrFail($id); 
 return $photo->imageable;
});

#POLYMORPHIC MANY TO MANY
Route::get('post/tag', function(){
$post = Post::find(1); 
 foreach ($post->tags as $key => $tag) {
 	# code...
 	echo $tag->name;
 }
});


#POLYMORPHIC MANY TO MANY RETRIEVING BY OWNER (TAG)
Route::get('tag/post', function(){
$tag = Tag::find(2); 

// return $tag->posts;

 foreach ($tag->posts as $key => $post) {
 	# code...
 	echo $post->title;
 }
});

