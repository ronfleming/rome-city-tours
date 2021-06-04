package com.techelevator.dao;

import com.techelevator.model.Landmark;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcLandmarkDAO implements LandmarkDAO {
    private JdbcTemplate jdbcTemplate;

    public JdbcLandmarkDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Landmark> getLandmarksData() {
        List<Landmark> theList = new ArrayList<>();
        String sql = "SELECT * FROM landmarks";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Landmark landmarkResults = mapRowToLandmark(results);
            theList.add(landmarkResults);
        }
        return theList;
    }

    public Landmark getLandmarkByLandmarkID(int landmarkID) {
        String sql = "SELECT * FROM landmarks WHERE landmark_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, landmarkID);
        results.next();
        Landmark landmark = mapRowToLandmark(results);
        return landmark;
    }

    private Landmark mapRowToLandmark(SqlRowSet results) {
        Landmark landmark = new Landmark();
        landmark.setLandmarkID(results.getInt("landmark_id"));
        landmark.setPlaceName(results.getString("place_name"));
        landmark.setImageRef1(results.getString("image_ref_1"));
        landmark.setImageRef2(results.getString("image_ref_2"));
        landmark.setImageRef3(results.getString("image_ref_3"));
        landmark.setVenueType(results.getString("venue_type"));
        landmark.setOperatingHours(results.getString("operating_hours"));
        landmark.setDescription(results.getString("description"));
        landmark.setLat(results.getBigDecimal("lat"));
        landmark.setLng(results.getBigDecimal("lng"));

        return landmark;
    }


}
