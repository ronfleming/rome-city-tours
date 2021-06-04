package com.techelevator.dao;

import com.techelevator.model.Rating;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcRatingDAO implements RatingDAO {
    private JdbcTemplate jdbcTemplate;
    public JdbcRatingDAO (JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int getPlaceRating(String placeName) {
        String sql = "SELECT SUM(rating) AS rating FROM ratings WHERE place_name = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, placeName);
        results.next();
        return results.getInt("rating");
    }
    @Override
    public void addPlaceRating(Rating rating) {
        String sql = "INSERT INTO ratings (place_name, user_id, rating) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, rating.getPlaceName(), rating.getUserID(), rating.getRating());
    }

    @Override
    public void updatePlaceRating(Rating rating) {
        String sql = "UPDATE ratings SET rating_id = ?, place_name = ?, " +
                "user_id = ?, rating = ?";
        jdbcTemplate.update(sql, rating.getRatingID(), rating.getPlaceName(),
                rating.getUserID(), rating.getRating());
    }
}
