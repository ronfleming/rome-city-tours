package com.techelevator.dao;

import com.techelevator.model.Favorite;

import java.util.List;

public interface FavoriteDAO {
    void addFavorite(Favorite favorite);
    List<Favorite> getFavoritesByUserID(int userID);
    void deleteFavorite(int favoriteID);
    List<Favorite> getAllFavorites();
}
