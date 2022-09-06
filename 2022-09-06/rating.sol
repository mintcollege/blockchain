// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


/*
- Title                         DONE
- Rating                        DONE
- Movie poster                  DONE
- Which vote did a user give    DONE
- Add new movie                 DONE
- Update movie title            DONE
*/

contract SeriesRating {

    struct Movie {
        uint movieid;
        string title;
        string url;
        bool nowshowing;
//        uint year;
//        uint numOfActors;
//        string moviequote;
    }

    address owner;
    mapping(uint => Movie) movies;

    // mapping(uint => string) titles;
    // mapping(uint => string) posters;

    // What rating a user gave to which movie
    mapping(address => mapping(uint => uint)) ratings;
    // user           movie id  rating


    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You shall not pass!");
        _;
    }

    // Adds a new movie
    function addMovie(string memory title, uint movieid, string memory posterurl) public onlyOwner {
        // Method 1:
        // movies[movieid] = Movie(movieid, title, posterurl);

        // Method 2:
        movies[movieid] = Movie({
        nowshowing: true,
        movieid: movieid,
        title: title,
        url: posterurl
        });
    }

    // Update movie title
    function updateMovie(uint movieid, string memory newtitle) public onlyOwner {
        // titles[movieid] = newtitle;
        Movie memory newmovie = movies[movieid];    // Copy struct to local var
        newmovie.title = newtitle;                  // Update local var
        movies[movieid] = newmovie;         // Overwrite the old struct
    }

    // Rate a movie
    function rateMovie(uint movieid, uint rating) public {
        require(rating > 0 && rating <= 5, "Your rating is all wrong.");
        ratings[msg.sender][movieid] = rating;
    }

    // View the rating of a user
    function getRating(address user, uint movieid) public view returns (uint) {
        return ratings[user][movieid];
    }

    // Change owner
    function changeOwner(address newowner) external {
        require(newowner != address(0), "Not a valid address");
        owner = newowner;
    }
}