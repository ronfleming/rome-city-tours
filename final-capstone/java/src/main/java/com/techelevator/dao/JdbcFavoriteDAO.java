package com.techelevator.dao;

import com.techelevator.model.Favorite;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcFavoriteDAO implements FavoriteDAO {
    private JdbcTemplate jdbcTemplate;
    public JdbcFavoriteDAO (JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addFavorite(Favorite favorite) {
        String sql = "INSERT INTO favorites (user_id, place_name, is_favorite) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, favorite.getUserID(), favorite.getPlaceName(), favorite.isFavorite());
    }
    @Override
    public List<Favorite> getFavoritesByUserID(int userID) {
        List<Favorite> theList = new ArrayList<>();
        String sql = "SELECT favorites_id, user_id, place_name, is_favorite FROM favorites WHERE user_id = ? AND is_favorite = true";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userID);
        while (results.next()) {
            Favorite favoriteResults = mapRowToFavorite(results);
            theList.add(favoriteResults);
        }

        return theList;
    }

    @Override
    public void deleteFavorite(int favoriteID) {
        String sql = "DELETE FROM favorites WHERE favorites_id = ?";
        jdbcTemplate.update(sql, favoriteID);
    }

    @Override
    public List<Favorite> getAllFavorites() {
        List<Favorite> theList = new ArrayList<>();
        String sql = "SELECT * FROM favorites";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Favorite resultFavorite = mapRowToFavorite(results);
            theList.add(resultFavorite);
        }
        return theList;
    }

    private Favorite mapRowToFavorite(SqlRowSet results) {
        Favorite favorite = new Favorite();
        favorite.setFavoriteID(results.getInt("favorites_id"));
        favorite.setUserID(results.getInt("user_id"));
        favorite.setPlaceName(results.getString("place_name"));
        favorite.setFavorite(results.getBoolean("is_favorite"));

        return favorite;
    }
}
