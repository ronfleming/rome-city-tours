BEGIN TRANSACTION;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS itinerary CASCADE;
DROP TABLE IF EXISTS ratings CASCADE;
DROP TABLE IF EXISTS favorites CASCADE;
DROP TABLE IF EXISTS landmarks;

DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_itinerary_id;
DROP SEQUENCE IF EXISTS seq_rating_id;
DROP SEQUENCE IF EXISTS seq_favorites_id;
DROP SEQUENCE IF EXISTS seq_landmark_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_itinerary_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_rating_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_favorites_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE SEQUENCE seq_landmark_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE itinerary (
    itinerary_id int DEFAULT nextval('seq_itinerary_id'::regclass) NOT NULL,
    user_id int NOT NULL,
    itinerary_name varchar(50),
    itinerary_date date,
    location1 int,
    location2 int,
    location3 int,
    location4 int,
    location5 int,
    location6 int,
    location7 int,
    location8 int,
    location9 int,
    location10 int,
    notes varchar(500),
    CONSTRAINT PK_itinerary PRIMARY KEY (itinerary_id),
    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE ratings (
    rating_id int DEFAULT nextval('seq_rating_id'::regclass) NOT NULL,
    place_name varchar(50) NOT NULL,
    user_id int NOT NULL,
    rating int NOT NULL,
    CONSTRAINT PK_rating PRIMARY KEY (rating_id),
    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE favorites (
    favorites_id int DEFAULT nextval('seq_favorites_id'::regclass) NOT NULL,
    user_id int NOT NULL,
    place_name varchar(50) NOT NULL,
    is_favorite BOOLEAN,
    CONSTRAINT PK_favorites PRIMARY KEY (favorites_id),
    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE landmarks (
    landmark_id int DEFAULT nextval('seq_landmark_id'::regclass) NOT NULL,
    place_name varchar(75) NOT NULL,
    image_ref_1 varchar(200),
    image_ref_2 varchar(200),
    image_ref_3 varchar(200),
    venue_type varchar(30),
    operating_hours varchar(300),
    description varchar(300),
    lat numeric,
    lng numeric,
    CONSTRAINT PK_landmarks PRIMARY KEY (landmark_id)
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
    VALUES ('Colosseum', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565802/assets/Colosseum-Rome-Italy_ytkull.jpg', 'Historical landmark', 'M-F, Sa & Su: 8:30AM - 7:00PM', 'Monumental 3-tiered Roman amphitheater once used for gladiatorial games, with guided tour option.', '41.889827', '12.492660' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Pantheon', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565816/assets/rome-pantheon-01_zbnmu4.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565816/assets/rome-pantheon-02_etnhz5.jpg', 'Monument', 'Temporarily closed', 'Iconic temple built circa 118 to 125 A.D. with a dome & Renaissance tombs, including Raphael''s.', '41.898694', '12.476757' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Foro Romano
	VALUES ('Roman Forum', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565816/assets/rome-pantheon-02_etnhz5.jpg', 'Museum', 'M-F: 10:30 AM - 05:30 PM, Sa & Su: Closed','Vast excavated area of Roman temples, squares & government buildings, some dating back 2,000 years.', '41.89245', '12.485331' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Palatine Hill', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565810/assets/palatine-hill-rome_e2x72n.jpg', 'Historical landmark', 'M-F, Sa & Su: 10:30AM - 07:15PM', 'Guided tours are available of the archaeological site housing the ruins of ancient imperial palaces.', '41.8894', '12.4875' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Basilica di San Pietro
	VALUES ('St. Peter''s Basilica', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565818/assets/st-peters-basilica-01_rcaawi.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565818/assets/st-peters-basilica-02_qmx2ea.jpg', 'Basilica', 'Consult Venue', 'Late Renaissance church by architects including Michelangelo & holding up to 20,000 worshippers.', '41.902202', '12.454143' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Piazza di Spagna
	VALUES ('Spanish Steps', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/piazza-di-spagna_ye6qei.jpg', 'Landmark', 'M-F, Sa & Su: 24HRS', 'Refined 18th-century square, location of the Spanish Steps & the Church of Trinità dei Monti.', '41.905973', '12.482786' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Casa di Augusto
	VALUES ('House of Augustus', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565817/assets/casa-di-augusto_dytexi.jpg', 'Historical landmark', 'Guided Tour Only/Consult Venue', 'Ruins of an ancient Roman imperial residence, with colorful frescoes, courtyards & studies.', '41.889015', '12.485172' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Arco di Costantino
	VALUES ('Arch of Constantine', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565804/assets/arco-costantino_rjgtcv.jpg', 'Historical landmark', 'M-F, Sa & Su: 24HRS', 'A 21m-high Roman structure made up of 3 arches decorated with figures & battle scenes.', '41.8898', '12.4906' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Colonna Traiana
	VALUES ('Trajan''s Column', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565823/assets/colonna-traiana-01_ncikfr.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565823/assets/colonna-traiana-02_ed0tlx.jpg', 'Monument', 'M-F, Sa & Su: 24HRS', 'A carved frieze winds up around the outside of this column erected upon victory in the Dacian wars.', '41.8958', '12.4843' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Piazza Venezia', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622578124/assets/piazza-venezia-r_tejvx5.jpg', 'Town square', 'M-F, Sa & Su: 24HRS', 'Imposing square, home to Plazzo Venezia', '41.8958', '12.4826' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Altare della Patria
	VALUES ('Altar of the Fatherland', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622577874/assets/altar-of-fatherland_n1sa5u.png', 'Landmark', 'M-F, Sa & Su: 24HRS', 'Grand marble, classical temple honoring Italy''s first king & First World War soldiers', '41.894587', '12.483139' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Fontana di Trevi
	VALUES ('Trevi Fountain', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565821/assets/trevi-fountain-01_zkoidb.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565819/assets/trevi-fountain-02_yvx8ng.jpg', 'Fountain', 'M-F, Sa & Su: 24HRS', 'Aqueduct-fed rococo fountain, designed by Nicola Salvi & completed in 1762, with sculpted figures.', '41.900914', '12.483498' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Basilica di Santa Maria Sopra Minerva
	VALUES ('St Maria Sopra Minerva Basilica', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565816/assets/santa-maria-sopra-minerva_di0zyb.jpg', 'Church', 'M-F: 07:00AM - 07:00 PM, Sa & Su: 08:00AM - 07:00PM', 'Lavish Gothic church known for its medieval tombs, Michelangelo sculpture & elephant obelisk.', '41.898', '12.478' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Piazza Navona', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/piazza-navona_zog5o9.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/piazza-navona-02_fhuh8l.jpg', 'Plaza', 'M-F, Sa & Su: 24HRS', 'Elegant square dating from the 1st century A.D., with a classical fountain, street artists & bars.', '41.8992', '12.4731' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Castel Sant''Angelo', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565822/assets/castel-santangelo_pschin.jpg', 'Castle', 'M-F, Sa & Su: 09:00 AM - 07:30PM', 'Circular, 2nd-century castle housing furniture & paintings collections in Renaissance apartments.', '41.9031', '12.4663' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Basilica di Santa Maria in Trastevere
	VALUES ('Basilica of Our Lady in Trastevere', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622573516/assets/basilica-santa-maria-in-trastevere_x2wzyz.jpg', 'Basilica', 'M-F, Sa & Su: 07:30AM - 09:00 PM', 'Grand Catholic church known for its 12th-century mosaics & lavish interior with 22 Roman columns.', '41.889489802555396', '12.4696121395021' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Basilica di San Giovanni in Laterano', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565805/assets/basilica-di-san-giovanni-in-laterano_ni4zfc.jpg', 'Basilica', 'M-F, Sa & Su: 07:00AM - 06:30PM', 'Landmark cathedral, the Pope''s official seat, with ornate 1700s facade & statues of the Apostles.', '41.8859', '12.5057' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Porta Maggiore
	VALUES ('Larger Gate', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565813/assets/porta-maggiore_xqcr2s.jpg', 'Historical place', 'M-F, Sa & Su: 24HRS', 'Double-arched gateway, in Rome''s 3rd-century city wall, with 2 aqueducts & a Latin inscription.', '41.8914', '12.5152' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Piazza del Popolo', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/piazza-del-popolo_femdl7.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/piazza-del-popolo-02_ivinam.jpg', 'Plaza', 'M-F, Sa & Su: 09:00AM - 09:00PM', 'Grand, landmark square centered by Rome''s oldest obelisk & the site of the city''s northern gate.', '41.9107', '12.4764' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Villa Borghese', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565819/assets/villa-borghese_bxwzqq.jpg', 'Park', 'M-F, Sa & Su: 24HRS', 'Lavish villa designed by Ponzio & Vasanzio, with formally landscaped gardens & a lake.', '41.9129', '12.4852' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Museo e Galleria Borghese
	VALUES ('Borghese Gallery and Museum', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565811/assets/borghese-gallery-and-museum-01_gddq7p.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565814/assets/borghese-gallery-and-museum-02_vkvzrs.jpg', 'Art museum', 'M-F: 09:00 AM - 07:30 PM, Sa & Su: Closed', 'Villa housing 15th- to 18th-century artworks with pieces by Bernini & Caravaggio.', '41.9142', '12.4921' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Chiesa di Santa Maria della Vittoria', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565822/assets/chiesa-di-santa-maria-della-vittoria_xyaspd.jpg', 'Church', 'M-F, Sa & Su: 08:30 AM - 06:00 PM', 'Flamboyant 17th-century church housing Bernini''s dramatic carving "The Ecstasy of Teresa.', '41.9047', '12.4944' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Santa Maria degli Angeli e dei Martiri', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565817/assets/santa-maria-degli-angeli-e-dei-martiri-01_hyf5lr.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565816/assets/santa-maria-degli-angeli-e-dei-martiri-02_n1wpk4.jpg', 'Basilica', 'M-F, Sa & Su: 07:00 AM - 07:30 PM', 'Basilica in the adapted remains of a Roman-era frigidarium with a meridian line designated in 1702.', '41.9032', '12.4969' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Basilica Papale di Santa Maria Maggiore', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565819/assets/basilica-papale-di-santa-maria-maggiore_yivxnv.jpg', 'Basilica', 'M-F, Sa & Su: 07:30 AM - 06:30 PM', 'Landmark papal basilica founded in the 5th century & known for its Roman mosaics & gilded ceiling.', '41.8976', '12.4984' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Basilica di Sant''Andrea delle Fratte', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622574461/assets/basilica-di-sant_andrea-delle-fratte-01_h6j0pz.jpg', 'Basilica', 'M-F, Sa & Su: 07:30 AM - 07:00 PM', '17th-century basilica featuring a single nave & 2 angels painted by artist Gian Lorenzo Bernini.', '41.9036', '12.4837' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Palazzo del Quirinale
	VALUES ('Quirinal Palace', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565809/assets/palazzo-del-quirinale_jbv5ty.jpg', 'Palace', 'M: Closed, Tu-F, Sa & Su: 09:30 AM - 04:00 PM', 'Former royal & papal residence, now the presidential palace & museum, on piazza offering city views.', '41.8996', '12.4870' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Palazzo Barberini', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565809/assets/palazzo-barberini_spg7tu.jpg', 'Tourist attraction', 'M: Closed, Tu-F, Sa & Su: 10:30 AM - 06:00 PM', 'This 17th-century Baroque palace now houses part of the National Gallery of Ancient Art.', '41.9033', '12.4898' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Porta Pinciana', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565815/assets/porta-pinciana_joqxzt.jpg', 'Historical landmark', 'M-F, Sa & Su: 24HRS', 'Built in the 5th century, this arched gate was a passageway through the 3rd-century city walls.', '41.9095', '12.4882' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Giardini Piazza Mazzini
	VALUES ('Piazza Mazzini Garden', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/piazza-mazzini-gardens_ultgub.jpg', 'Park', 'M-F, Sa & Su: 24HRS', 'The Piazza Mazzini gardens in Rome are famous for Renaissance fountains designed by architect Raffaele De Vico.', '41.916073', '12.464081' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Fontana delle Naiadi
	VALUES ('Fountain of the Naiads', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565804/assets/fountain-of-the-naiads_uc1cz0.jpg', 'Tourist attraction', 'M-F, Sa & Su: 24HRS', 'Landmark plaza fountain depicting 4 bronze naiads, a horse, dragon & a sea monster, erected in 1901.', '41.9027', '12.4962' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Museo Nazionale Romano, Palazzo Massimo alle Terme
	VALUES ('Palazzo Massimo alle Terme', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565811/assets/palazzo-massimo-alle-terme-01_vvis7o.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565810/assets/palazzo-massimo-alle-terme-02_bgmos6.jpg', 'Archaeological museum', 'M-F: 02:00 AM - 07:45 PM, Sa & Su: 10:30 AM - 07:45 PM ', 'Neo-Renaissance palace with a classical art collection including sculptures, mosaics & gold jewelry.', '41.9014', '12.4983' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Chiesa di Sant''Andrea al Quirinale', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622575258/assets/chiesa-di-sant_andrea-al-quirinale_xmznjl.jpg', 'Basilica', 'M: Closed, Tu-F, Sa & Su: 09:00 AM - 06:00 PM', 'Oval baroque church designed by Gian Lorenzo Bernini for the Jesuits, with guided tours available.', '41.9007', '12.4894' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Villa Carlo Alberto al Quirinale
	VALUES ('Villa Carlo Alberto at the Quirinale', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565820/assets/villa-carlo-alberto-quirinale.jpg', 'Park', 'M-F, Sa & Su: 24HRS', 'Villa Carlo Alberto al Quirinale is a park in the heart of Rome and is a great spot to walk around in between a spot of sightseeing.', '41.899672', '12.488552' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Giardini del Quirinale', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565805/assets/giardini-del-quirinale_zfhsji.jpg', 'Garden', 'M: Closed, Tu-F, Sa & Su: 09:30 AM - 04:00 PM', 'Elegant landscaped gardens featuring fountains & classical sculptures, plus an 18th-c. coffee house.', '41.901', '12.4874' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Chiesa di Sant'' Ignazio di Loyola', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565820/assets/chiesa-di-sant_-ignazio-di-loyola-01_wqb0pf.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565822/assets/chiesa-di-sant_-ignazio-di-loyola-02_o2off4.jpg', 'Church', 'M-F, Sa & Su: 07:30 AM - 07:00 PM', '17th-century Roman Catholic church with trompe l''oeil ceilings & frescoes depicting St Ignatius.', '41.8988', '12.4799' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Il Tempio di Adriano', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565806/assets/il-tempio-di-adriano_vnpyli.jpg', 'Historical place', 'Consult Venue', 'Roman temple from 145 AD, with 11 Corinthian columns standing; now facade for a conference center.', '41.8999', '12.4794' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Colonna di Marco Aurelio
	VALUES ('Marcus Aurelius Column', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565807/assets/marcus-aurelius-column-01_wudu8a.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565806/assets/marcus-aurelius-column-02_gkhf3q.jpg', 'Monument', 'M-F, Sa & Su: 24HRS', 'Carved military scenes line this 2nd-century AD marble column, honouring Marcus Aurelius'' victories.', '41.9009', '12.4800' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Fori Imperiali
	VALUES ('Imperial Fora', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565802/assets/fori-imperiali_oqtbqf.jpg', 'Historical landmark', 'M: Closed, Tu-F, Sa & Su: 09:00 AM - 07:00 PM', 'Public squares forming the center of the Roman Empire, built between 46 BCE & 113 CE.', '41.8957', '12.4841' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Mercati di Traiano Museo dei Fori Imperiali
	VALUES ('Trajan''s Market', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565818/assets/trajan_s-market_qoppit.jpg', 'Museum', 'M-F, Sa & Su: 09:30 AM - 07:30 PM', 'Roman shopping center with preserved forums, great hall markets & archaeological exhibits.', '41.8956', '12.4862' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Foro di Augusto
	VALUES ('Forum of Augustus', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565803/assets/forum-of-augustus_oracyc.jpg', 'Historical place', 'Consult Venue', 'Ancient ruins of a forum built to include a temple to Mars & provide space for legal proceedings.', '41.8943', '12.4869' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Foro di Cesare Viaggio nei Fori
	VALUES ('Forum of Caesar', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565804/assets/forum-of-caesar_dlrguf.jpg', 'Tourist attraction', 'M-F, Sa & Su: 24HRS', 'The Forum of Caesar, begun by Caesar, who dedicated the temple in 46 BC, and finished by Augustus, set both the orientation and the general pattern for the subsequent imperial fora.', '41.8939', '12.485' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Palazzo Spada', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565811/assets/palazzo-spada_jpq6qf.jpg', 'Palace', 'Tu: closed, W-M: 08:30 AM - 07:30 PM, Sa & Su: 08:30 AM - 07:30 PM', 'A magnificent, yet lesser-known, palace located in the Regola district of Rome. It features an extraordinary art collection which showcases works by the likes of Guido Reni, Titian, Guercino, and Caravaggio to name a few.', '41.8942', '12.4719' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Palazzo Madama
	VALUES ('Madama Palace', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622576560/assets/palazzo-madama_dtfxqf.jpg', 'Palace', 'Tu: closed, M-W: 08:30 AM - 07:30 PM, Sa & Su: 08:30 AM - 07:30 PM', 'Seat of the Italian senate, housed in a former 15th-century Medici palace with later Baroque facade.', '41.8992', '12.4741' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Church of Santa Maria della Pace', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565824/assets/church-of-santa-maria-della-pace_xwhjob.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565822/assets/church-of-santa-maria-della-pace-02_ia2ue1.jpg', 'Church', 'M-F, Sa & Su: 09:30 AM - 06:30 PM', '1400s church with curving porticoed facade, plus frescoes by Raphael & elegant, 2-tiered cloisters.', '41.8999', '12.4717' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Chiesa Parrocchiale di San Giovanni Battista dei Fiorentini

	VALUES ('Church of Saint John Baptist ''dei Fiorentini', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565825/assets/church-of-saint-john-baptist-dei-fiorentini_ssxlf7.jpg', 'Church', 'Consult Venue', 'San Giovanni dei Fiorentini is a minor basilica and a titular church in the Ponte rione of Rome, Italy. Dedicated to St. John the Baptist.', '41.899667', '12.464594' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Ponte Sant'Angelo
	VALUES ('St. Angelo Bridge', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565817/assets/st-angelo-bridge_rshms8.jpg', 'Bridge', 'M-F, Sa & Su: 24HRS', 'Pedestrian bridge, built in 134 A.D., with travertine marble fascias & spanning the River Tiber.', '41.9018', '12.4665' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Basilica Santa Maria in Montesanto
	VALUES ('Church of Saint Mary in Montesanto', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565823/assets/church-of-saint-mary-in-montesanto_lrhkyw.jpg', 'Church', 'M-F: 06:30 AM - 07:30 PM, Sa: Closed, Su: 11:30 AM - 01:15 PM', 'One of twin churches on the Piazza del Popol, this stately baroque church is known to honor artists.', '41.9099', '12.4769' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Museo Nazionale Romano Palazzo Altemps', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565823/assets/church-of-saint-mary-in-montesanto_lrhkyw.jpg', 'Archaeological museum', 'M: closed, Tu-F: 02:00 AM - 07:45 PM, Sa & Su: 10:30 AM - 07:45 PM', 'An aristocratic mansion that was already home in the 16th century to a rich collection of classical sculpture in a magnificent architectural setting.', '41.9011', '12.4731' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Basilica Santi Giovanni e Paolo', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565807/assets/basilica-santi-giovanni-e-paolo-01_knhqsc.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565820/assets/basilica-santi-giovanni-e-paolo-02_hsiocq.jpg', 'Basilica', 'M: Closed, Tu-F, Sa & Su: 08:30 AM - 06:00 PM', 'Ancient hilltop basilica, dating from the 4th century, built atop a network of ornate Roman rooms.', '45.4394', '12.3417' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) -- Cappella Sistina
	VALUES ('Sistine Chapel', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565816/assets/cappella-sistina_siwgj5.jpg', 'Church', 'M-F: 09:00AM - 04:00PM, Sa: 09:00AM - 04:00PM, Su: Closed', 'Famous chapel in the Vatican Museums, best known for Michelangelo''s 16th-century painted ceiling.', '41.9029', '12.4545' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Fontana del Sacramento', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565802/assets/fontana-del-sacramento_mkxphl.jpg', 'Fountain', 'M-F, Sa & Su: 24HRS', 'Fountain of Towers, Vatican Gardens. Because it somewhat resembles an altar, this fountain has also been called the Fountain of the Sacrament.', '41.9034', '12.4535' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Museo Chiaramonti
	VALUES ('Chiaramonti Museum', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565821/assets/chiaramonti-museum_gic8yb.jpg', 'Museum', 'M-F: 09:00AM - 07:00PM, Sa: 09:00AM - 07:00PM, Su: Closed', 'Museum comprising a grand loggia lined with classical sculptures including Roman busts & friezes.', '41.9058', '12.4551' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Galleria dei Candelabri', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565804/assets/galleria-dei-candelabri_g9z9mz.jpg', 'Museum', 'M-F: 09:00AM - 07:00PM, Sa: 09:00AM - 07:00PM, Su: Closed', 'The Galleria dei Candelabri contains some important didactic art as well as the superb candelabra that give the room its name.', '41.9058', '12.4541' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Giardino Quadrato', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565805/assets/giardino-quadrato_lcsrew.jpg', 'Garden', 'M-F, Sa & Su: 24HRS', 'The historical garden decorates the squared plaza with four sprawling grass planes in front of the Pinacoteca.', '41.9054', '12.4528' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Giardini Vaticani
	VALUES ('Gardens of Vatican City', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565805/assets/gardens-of-vatican-city_fvofea.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565804/assets/gardens-of-vatican-city-02_eofo99.jpg', 'Garden', 'M-F: 09:00AM - 06:00PM, Sa: 09:00AM - 06:00PM, Su: Closed', 'Urban green spaces dating from the 13th century with Renaissance & Baroque fountains & sculptures.', '41.9036', '12.4502' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Porta Pertusa', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565815/assets/porta-pertusa_jqivxd.jpg', 'Historical landmark', 'Consult Venue', 'Leonine Wall gate, built in the 14th or 15th c. & overlooked by the Vatican''s Torre San Giovanni.', '41.9014', '12.4474' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Fontana della Stazione Ferroviaria Vaticana', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565815/assets/porta-pertusa_jqivxd.jpg', 'Tourist attraction', 'M-F: 09:00AM - 06:15PM, Sa: 09:00AM - 01:15PM, Su: Closed', 'The Vatican City railway station is the only railway station of the Vatican Railway.', '41.9011', '12.4514' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Piazza Santa Marta', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565814/assets/piazza-santa-marta_dqsuov.jpg', 'Park', 'M-F, Sa & Su: 24HRS', 'The Square Fountain is a water feature in St. Martha''s Square Fountain close to Piazza di Santa Maria.', '41.9012', '12.4527' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Fontana del Bernini
	VALUES ('Bernini Fountain', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/bernini-fountain.jpg_bneewz.jpg', 'Tourist attraction', 'M-F, Sa & Su: 24HRS', 'The Bernini fountain is located on the southern side of the square. This fountain was comissioned by Pope Clemente X.', '41.9017', '12.4573' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Obelisco di Piazza San Pietro', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565809/assets/obelisco-di-piazza-san-pietro_tdji4g.jpg', 'Historical landmark', 'M-F, Sa & Su: 24HRS', 'Monumental granite obelisk dating to Ancient Egyptian times & embellished with papal coats of arms.', '41.9022', '12.4573' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Piazza San Pietro
	VALUES ('St. Peter''s Square', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565815/assets/piazza-san-pietro_kk0zkt.jpg', 'Town square', 'M-F, Sa & Su: 24HRS', 'St. Peter''s Square is a large plaza located directly in front of St. Peter''s Basilica in the Vatican City.', '41.9022', '12.4567' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Faro del Gianicolo
	VALUES ('Faro di Roma', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565802/assets/faro-di-roma_n38zf3.jpg', 'Monument', 'M-F, Sa & Su: 24HRS', 'Lighthouse on Janiculum', '41.8948', '12.4609' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Monumento ad Anita Garibaldi', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565808/assets/monumento-anita-garibaldi_wneljl.jpg', 'Sculpture', 'M-F, Sa & Su: 24HRS', 'The bronze equestrian statue of Anita Garibaldi is located in Gianicolo Hill.', '41.8934', '12.4601' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Parco del Gianicolo', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565811/assets/parco-del-gianicolo_mppxfi.jpg', 'Park', 'M-F, Sa & Su: 24HRS', 'On the left bank of the River Tiber, this public park offers a leafy escape from the busy city.', '41.8915', '12.4615' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Porta Settimiana', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565815/assets/porta-settimiana_mgoofn.jpg', 'Landmark', 'M-F, Sa & Su: 24HRS', 'Ancient gate with battlements & an archway adjoining historic 3rd-century city walls.', '41.8922', '12.4676' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Villa Farnesina', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565820/assets/villa-farnesina_fz399z.jpg', 'Art museum', 'M-F: 09:00AM - 04:00PM, Sa: 09:00AM - 04:00PM, Su: Closed', 'Villa designed by Baldassare Peruzzi, with fresco decorations by major artists including Raphael.', '41.8936', '12.4673' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Chiesa di San Pietro in Montorio', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565821/assets/chiesa-san-pietro-montorio_jlc6sw.jpg', 'Church', 'M-F, Sa & Su: 09:00 AM - 04:00 PM', 'Place of worship with ornate chapels by artists including Bernini & Cerruti tombs.', '41.8887', '12.4664' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Chiesa di S.Maria della Scala
	VALUES ('St Mary of the Staircase', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565817/assets/st-mary-of-the-staircase_oxtygl.jpg', 'Church', 'M-F, Sa & Su: 10:00 AM - 07:00 PM', 'Santa Maria della Scala is a titular church in Rome, Italy, located in the Trastevere rione.', '41.8911', '12.4678' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Basilica di San Crisogono', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565809/assets/basilica-di-san-crisogono_agrpyq.jpg', 'Basilica', 'M-F, Sa & Su: 07:00 AM - 07:00 PM', 'Early Christian-era ruins, plus medieval paintings, within a landmark shrine honoring a holy martyr.', '41.8891', '12.4737' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng)
	VALUES ('Chiesa di San Francesco a Ripa Grande', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565824/assets/chiesa-san-francesco-grande-01_hfsrcy.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565824/assets/chiesa-san-francesco-grande-02_cmkmdt.jpg', 'Church', 'M-F, Sa & Su: 07:15 AM - 07:45 PM', 'Landmark Baroque Catholic church housing sculptures by Gian Lorenzo Bernini & De Chirico''s tomb.', '41.8852', '12.4731' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Bocca della Verità
	VALUES ('Mouth of Truth', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565808/assets/mouth-of-truth_drp0gh.jpg', 'Sculpture', 'M-F, Sa & Su: 09:30 AM - 05:50 PM', 'Carving of man''s face on ancient manhole cover, a popular attraction due to the myth attached to it.', '41.8881', '12.4814' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Circo Massimo
	VALUES ('Circus Maximus', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565825/assets/circus-maximus_sr3zbt.jpg', 'Historical place', 'Consult Venue', 'Green space & remains of a stone & marble arena that could seat 250,000 Romans for chariot races.', '41.88552', '12.48576' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Porta Metronia', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565814/assets/porta-metronia_fillli.jpg', 'Historical landmark', 'M-F, Sa & Su: 24HRS', 'Porta Metronia is a gate in the third-century Aurelian Walls of Rome.', '41.8823', '12.4986' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Giardini di via Carlo Felice', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565805/assets/giardini-via-carlo-felice_dnij1x.jpg', 'Park', 'M-F, Sa & Su: 24HRS', 'Ancient ruins by the garden.', '41.8869', '12.5117' );

INSERT INTO landmarks (place_name, image_ref_1, image_ref_2, venue_type, operating_hours, description, lat, lng) --Basilica di Santa Croce in Gerusalemme
	VALUES ('Basilica of the Holy Cross in Jerusalem', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565808/assets/basilica-holy-cross-jerusalem_kwy1qf.jpg', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565803/assets/basilica-holy-cross-jerusalem-02_jofape.jpg', 'Basilica', 'M-F, Sa & Su: 07:00 AM - 07:30 PM', 'This Catholic site, founded around 320 A.D., contains several relics, housed in a 1930s addition.', '41.8882', '12.5158' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Museo Storico della Fanteria', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565809/assets/museo-storico-della-fanteria_dsrcld.png', 'Art museum', 'Temporarily closed', 'This historical museum consists of relics, documents, sculptures, and paintings related to military history from the Ancient times to the Union of Italy.', '41.8895', '12.5161' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Stadio Olimpico', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565818/assets/stadio-olimpico_bb0qkn.jpg', 'Stadium', 'Consult Venue', 'Stadium of soccer clubs Lazio & Roma plus the venue for Coppa Italia final & international matches.', '41.9341', '12.4547' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng) --Terme di Caracalla
	VALUES ('Baths of Caracalla', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565814/assets/baths-of-caracalla_oztfg5.jpg', 'Ruin', 'M-F, Sa & Su: 09:00 AM - 06:15 PM', 'Ruins of a vast rectangular-shaped Roman thermal bath complex used from around 216 A.D. to 537 A.D.', '41.8790', '12.4924' );

INSERT INTO landmarks (place_name, image_ref_1, venue_type, operating_hours, description, lat, lng)
	VALUES ('Parco Regionale dell''Appia Antica', 'https://res.cloudinary.com/dba0u6779/image/upload/v1622565811/assets/parco-regionale-antica_qpjpkp.jpg', 'Park', 'M-F, Sa & Su: 09:30 AM - 06:00 PM', '3,400-acre park along 16km of the Roman road preserving important ancient Roman tombs & villas.', '41.8683', '12.5024' );

INSERT INTO itinerary (user_id, itinerary_name, itinerary_date, location1, location2, location3, location4, location5, notes)
    VALUES ('1', 'Day One', '2021-06-05', '1', '2', '3', '4', '5', 'These are my notes!');

INSERT INTO itinerary (user_id, itinerary_name, itinerary_date, location1, location2, location3, location4, location5, notes)
    VALUES ('1', 'Day Two', '2021-06-06', '3', '4', '5', '6', '7', 'Here are some other notes!');

    INSERT INTO itinerary (user_id, itinerary_name, itinerary_date, location1, location2, location3, location4, location5, notes)
        VALUES ('1', 'Day Three', '2021-06-07', '5', '7', '9', '11', '13', 'More notes!');

INSERT INTO favorites (user_id, place_name, is_favorite) VALUES (1, 'Hadrian''s Arch', true);
INSERT INTO favorites (user_id, place_name, is_favorite) VALUES (1, 'Colosseum', true);
INSERT INTO favorites (user_id, place_name, is_favorite) VALUES (1, 'Roman Forum', true);




COMMIT TRANSACTION;
