#Thunderclap

A clone of the popular music-sharing website Soundcloud.com.  Please feel free to log-in as the demo user and play around and listen to some great music!

##Technologies

###Rails
* Uses RESTful routes and models to easily create / read / update / destroy models.
* Uses custom jBuilder to return only select / necessary data to Backbone.js models.
* Creates individual Follow, Like, and PlaylistSong models to keep track of who a user is following, what songs they have liked, and what songs each of their playlists contains.

###Backbone.js
* Combines the MVC design paradigm with custom JSON returned from jBuilder views in Rails to allow the site to allow quick navigation and loading of user / song data.

###audio.js
* Uses the awesome audio.js plug-in to provide a constant soundbar on the bottom of the page.  The soundbar lives inside of a footer in application.html.erb, allowing it to stay with you as you navigate around the site (just like Soundcloud!).
* I also used the progress bar included with the plug-in to create custom progress bars behind the waveform images for each song (again, just like Soundcloud!).
  * By using the setInterval() function in Javascript along with a custom renderProgressBar function I created, I was able to mirror the progress bar at the bottom of the page.  This progress bar is tied to each view but also checks to see if the view's model has the same Track source as the audio player.  This allows the progress bar to appear at the correct location no matter where a song is displayed. Test it out for yourself! Start playing a song from it's Show page and the progress bar will be there if you go back to the Stream page.

###Paperclip
* Combined with Amazon S3 - allows the site to quickly upload and save user images and song files / images.

###waveform-paperclip
* Normally, this gem allows you to create custom waveform images when you upload with Paperclip. Unfortunately, this gem requires the uses of libsndfile, which lives locally on your desktop and is not uploaded to Heroku.  Thus, if you upload using the live site, it cannot create these custom images which is a total bummer.

### CSS
* All custom CSS! No uses of Bootstrap or any other styling framework.
  
##To-do
* Implement an Explore page to allow users to explore songs by genre.
* Fix search! In taming my seed data I managed to break search.  It works in the Rails console so fixing it on the live site shouldn't be too bad.
* Modal views for adding / removing songs from playlists.
* Make sure that the duration in the bottom progress bar updates consistently, as it does not always update properly when you start playing a new song.  Unfortunately, this leads to the progress bar sometimes getting out of whack.


