package com.techelevator.dao;

import com.techelevator.model.Itinerary;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcInteraryDAO implements ItineraryDAO {

    private JdbcTemplate jdbcTemplate;
    public JdbcInteraryDAO (JdbcTemplate jdbcTemplate) {
            this.jdbcTemplate = jdbcTemplate;
        }

    @Override
    public void createItinerary(Itinerary itinerary) {
        String sql = "INSERT INTO itinerary (user_id, itinerary_name, itinerary_date, " +
                "location1, " +
                "location2, " +
                "location3, " +
                "location4, " +
                "location5, " +
                "location6, " +
                "location7, " +
                "location8, " +
                "location9, " +
                "location10, notes) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, itinerary.getUserID(), itinerary.getItineraryName(), itinerary.getItineraryDate(),
                itinerary.getLocation1(), itinerary.getLocation2(),
                itinerary.getLocation3(), itinerary.getLocation4(),
                itinerary.getLocation5(), itinerary.getLocation6(),
                itinerary.getLocation7(), itinerary.getLocation8(),
                itinerary.getLocation9(), itinerary.getLocation10(),
                itinerary.getNotes());
    }

    @Override
    public List<Itinerary> getItinerariesByUser(int userID) {
        List<Itinerary> theList = new ArrayList<>();
        String sql = "SELECT * FROM itinerary WHERE user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userID);
        while (results.next()) {
            Itinerary itineraryResult = mapRowToItinerary(results);
            theList.add(itineraryResult);
        }
        return theList;
    }

    @Override
    public void updateItinerary(Itinerary itinerary) {
        String sql = "UPDATE itinerary SET user_id = ?, " +
                "itinerary_name = ?, " +
                "itinerary_date = ?, " +
                "location1 = ?, " +
                "location2 = ?, " +
                "location3 = ?, " +
                "location4 = ?, " +
                "location5 = ?, " +
                "location6 = ?, " +
                "location7 = ?, " +
                "location8 = ?, " +
                "location9 = ?, " +
                "location10 = ?, " +
                "notes = ? WHERE itinerary_id = ?";
        jdbcTemplate.update(sql, itinerary.getUserID(), itinerary.getItineraryName(), itinerary.getItineraryDate(),
                itinerary.getLocation1(), itinerary.getLocation2(),
                itinerary.getLocation3(), itinerary.getLocation4(),
                itinerary.getLocation5(), itinerary.getLocation6(),
                itinerary.getLocation7(), itinerary.getLocation8(),
                itinerary.getLocation9(), itinerary.getLocation10(),
                itinerary.getNotes(), itinerary.getItineraryID());
    }

    @Override
    public Itinerary getItineraryByItineraryID(int id) {
        String sql = "SELECT * FROM itinerary WHERE itinerary_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        results.next();
        Itinerary itineraryResults = mapRowToItinerary(results);
        System.out.println(itineraryResults.getItineraryID());
        return itineraryResults;
    }

    @Override
    public void deleteItineraryByItineraryID(int id) {
        String sql = "DELETE FROM itinerary WHERE itinerary_id = ?";
        jdbcTemplate.update(sql, id);
    }

    private Itinerary mapRowToItinerary(SqlRowSet results) {
        Itinerary itinerary = new Itinerary();
        itinerary.setItineraryID(results.getInt("itinerary_id"));
        itinerary.setUserID(results.getInt("user_id"));
        itinerary.setItineraryName(results.getString("itinerary_name"));

        LocalDate localDate = results.getDate("itinerary_date").toLocalDate();
        itinerary.setItineraryDate(localDate);

        itinerary.setLocation1(results.getInt("location1"));
        itinerary.setLocation2(results.getInt("location2"));
        itinerary.setLocation3(results.getInt("location3"));
        itinerary.setLocation4(results.getInt("location4"));
        itinerary.setLocation5(results.getInt("location5"));
        itinerary.setLocation6(results.getInt("location6"));
        itinerary.setLocation7(results.getInt("location7"));
        itinerary.setLocation8(results.getInt("location8"));
        itinerary.setLocation9(results.getInt("location9"));
        itinerary.setLocation10(results.getInt("location10"));
        itinerary.setNotes(results.getString("notes"));

        return itinerary;
    }
}
