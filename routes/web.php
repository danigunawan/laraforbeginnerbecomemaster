<?php
use App\Post;
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
## Bedanya 
Route::get('create', function(){
	// $posts = App\Post; # jika tidak pakai use App\Post;
	Post::create(['title' => 'the create method', 'content' => 'wow I\'am learning alot dani']); # jika pakai use App\Post;

});