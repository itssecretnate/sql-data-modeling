CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    username VARCHAR(16) NOT NULL,
    picture TEXT
 );
 
 CREATE TABLE authentication (
    user_id SERIAL NOT NULL REFERENCES users(user_id),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    dob date NOT NULL,
    phone_number VARCHAR(11) NOT NULL UNIQUE
 );

CREATE TABLE likes (
  like_id SERIAL PRIMARY KEY,
  user_id SERIAL NOT NULL REFERENCES users(user_id),
  recipe_id SERIAL
);

CREATE TABLE occasion(
  user_id SERIAL NOT NULL REFERENCES users(user_id),
  occasion_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  date_start DATE NOT NULL,
  date_end DATE
);


CREATE TABLE recipe (
  user_id SERIAL NOT NULL REFERENCES users (user_id),
  recipe_id SERIAL PRIMARY KEY,
  date_posted DATE NOT NULL,
  recipe_content TEXT,
  recipe_instructions TEXT,
  private BOOLEAN,
  occasion_id SERIAL NOT NULL REFERENCES occasion (occasion_id),
  picture TEXT,
  rating INTEGER
);

CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  comment_body VARCHAR(255) NOT NULL,
  user_id SERIAL NOT NULL REFERENCES users(user_id),
  recipe_id SERIAL NOT NULL REFERENCES recipe (recipe_id)
);

-- Grocery and Ingredient List Section

CREATE TABLE ingredient (
  ingredient_id SERIAL PRIMARY KEY,
  ingredient_name VARCHAR(30) NOT NULL,
  price FLOAT
);

CREATE TABLE ingredient_list (
  recipe_id SERIAL REFERENCES recipe(recipe_id),
  list_id SERIAL PRIMARY KEY,
  ingredient_id SERIAL REFERENCES ingredient(ingredient_id),
  quantity FLOAT NOT NULL
);

CREATE TABLE grocery_list (
  grocery_list_id SERIAL PRIMARY KEY,
  user_id SERIAL NOT NULL REFERENCES users(user_id),
  date_create DATE NOT NULL,
  ingredient_list_id SERIAL NOT NULL
);