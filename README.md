# Shorten.me

## Installation Guide

Clone the repo from github, open up your terminal and run 

```
bundle install
```

then run 

```
yarn install
```

and finally run 

```
rails db:create db:migrate
```

After having done all that, the environment should be set and you should be able to run the app by going to your terminal and running

```
rails server
```

then navigate to https://localhost:3000 in your browser.

That's it!

### Features

* Allows users to register and log in
* Allows users to generate short links
* Allows users to delete their short links
* Allows users to see how many times their short link has been visited
* Accessing the generated short links will redirect to the provided link
* Does not require a user to register or sign in to visit a short link
