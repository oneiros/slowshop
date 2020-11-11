# README

## Installation

Install gem dependencies:

```sh
bundle install
```

Edit the credentials file. Rails will generate a new file and master key for you.
(Note: You may need to set the `EDITOR` env variable):

```sh
bin/rails credentials:edit
```

Save the file and exit.

Setup the database(s):

```sh
bin/rails db:setup
```

Generate sample images (this might take a while):

```sh
bin/rails generate_images
```
