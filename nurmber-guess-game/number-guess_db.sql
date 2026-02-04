-- Create a data base

CREATE DATABASE number_guess;

CREATE TABLE users(user_id SERIAL PRIMARY KEY, name VARCHAR(22) UNIQUE NOT NULL);

CREATE TABLE games(game_id SERIAL PRIMARY KEY, number_guess INT NOT NULL, number_attempt INT NOT NULL, play_dated DATE DEFAULT NOW(), user_id INT NOT NULL,CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(user_id));
