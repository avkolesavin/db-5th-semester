INSERT INTO season (id, name, start_date, end_date) VALUES
(1, 'Зима', '2023-12-01', '2024-02-28'),
(2, 'Весна', '2024-03-01', '2024-05-31'),
(3, 'Лето', '2024-06-01', '2024-08-31'),
(4, 'Осень', '2024-09-01', '2024-11-30');

INSERT INTO tourist_category (id, name, description) VALUES
(1, 'Новичок', 'Туристы, которые только начинают свое путешествие и имеют ограниченный опыт'),
(2, 'Любитель', 'Туристы, которые имеют некоторый опыт и хорошо справляются с базовыми задачами'),
(3, 'Продвинутый', 'Туристы, которые имеют значительный опыт и могут справиться с более сложными задачами'),
(4, 'Эксперт', 'Туристы, которые имеют обширный опыт и могут справиться с любыми задачами');

INSERT INTO guide_category (id, name, description) VALUES
(1, 'Начальный', 'Гиды, которые только начинают свою карьеру и имеют ограниченный опыт'),
(2, 'Продвинутый', 'Гиды, которые имеют значительный опыт и могут справиться с более сложными задачами'),
(3, 'Эксперт', 'Гиды, которые имеют обширный опыт и могут справиться с любыми задачами');

INSERT INTO equipment_type (id, name, season_id, parent_id) VALUES
(1, 'Теплая одежда', 1, NULL),
(2, 'Зимняя обувь', 1, NULL),
(3, 'Лыжи / сноуборд', 1, NULL),
(4, 'Снегоступы', 1, NULL),
(5, 'Термос для горячих напитков', 1, NULL),
(6, 'Дождевик или водонепроницаемая куртка', 2, NULL),
(7, 'Обувь на сухую и влажную погоду', 2, NULL),
(8, 'Палатка с защитой от дождя', 2, NULL),
(9, 'Спальник средней температуры', 2, NULL),
(10, 'Легкая одежда', 3, NULL),
(11, 'Кепка или шляпа от солнца', 3, NULL),
(12, 'Солнцезащитный крем', 3, NULL),
(13, 'Палатка с москитной сеткой', 3, NULL),
(14, 'Гамак', 3, NULL),
(15, 'Теплая одежда', 4, NULL),
(16, 'Водонепроницаемая обувь', 4, NULL),
(17, 'Палатка с защитой от дождя', 4, NULL),
(18, 'Термос для горячих напитков', 4, NULL);

INSERT INTO equipment (id, name, weight, value, rent_price, count, equipment_type_id) VALUES
(1, 'Теплая одежда S', 1.0, 0.03, 500.0, 10, 1),
(2, 'Теплая одежда M', 1.2, 0.04, 600.0, 8, 1),
(3, 'Теплая одежда L', 1.4, 0.05, 700.0, 6, 1),
(4, 'Зимняя обувь 38 размер', 0.8, 0.025, 800.0, 7, 2),
(5, 'Зимняя обувь 40 размер', 0.9, 0.027, 850.0, 5, 2),
(6, 'Зимняя обувь 42 размер', 1.0, 0.03, 900.0, 3, 2),
(7, 'Лыжи 150 см', 4.0, 0.09, 2000.0, 15, 3),
(8, 'Лыжи 160 см', 4.5, 0.1, 2200.0, 10, 3),
(9, 'Сноуборд 155 см', 5.0, 0.12, 2500.0, 8, 3),
(10, 'Снегоступы S', 2.0, 0.06, 1200.0, 20, 4),
(11, 'Снегоступы M', 2.2, 0.065, 1300.0, 18, 4),
(12, 'Снегоступы L', 2.4, 0.07, 1400.0, 16, 4),
(13, 'Термос 0.5 л', 0.5, 0.002, 300.0, 30, 5),
(14, 'Термос 0.7 л', 0.6, 0.003, 350.0, 25, 5),
(15, 'Термос 1.0 л', 0.7, 0.004, 400.0, 20, 5),
(16, 'Дождевик S', 1.0, 0.03, 500.0, 10, 6),
(17, 'Дождевик M', 1.2, 0.04, 600.0, 8, 6),
(18, 'Дождевик L', 1.4, 0.05, 700.0, 6, 6),
(19, 'Обувь на сухую погоду 38 размер', 0.8, 0.025, 800.0, 7, 7),
(20, 'Обувь на сухую погоду 40 размер', 0.9, 0.027, 850.0, 5, 7),
(21, 'Обувь на сухую погоду 42 размер', 1.0, 0.03, 900.0, 3, 7),
(22, 'Обувь на влажную погоду 38 размер', 0.8, 0.025, 800.0, 7, 7),
(23, 'Обувь на влажную погоду 40 размер', 0.9, 0.027, 850.0, 5, 7),
(24, 'Обувь на влажную погоду 42 размер', 1.0, 0.03, 900.0, 3, 7),
(25, 'Палатка с защитой от дождя 2 места', 4.0, 0.09, 2000.0, 15, 8),
(26, 'Палатка с защитой от дождя 3 места', 4.5, 0.1, 2200.0, 10, 8),
(27, 'Палатка с защитой от дождя 4 места', 5.0, 0.12, 2500.0, 8, 8),
(28, 'Спальник средней температуры S', 2.0, 0.06, 1200.0, 20, 9),
(29, 'Спальник средней температуры M', 2.2, 0.065, 1300.0, 18, 9),
(30, 'Спальник средней температуры L', 2.4, 0.07, 1400.0, 16, 9);

INSERT INTO transport_type (id, name, description) VALUES
(1, 'Автомобиль', 'Личный транспорт для небольшого количества людей'),
(2, 'Внедорожник', 'Транспорт для сложных дорожных условий'),
(3, 'Автобус', 'Транспорт для больших групп людей'),
(4, 'Лодка', 'Транспорт для передвижения по воде'),
(5, 'Снегоход', 'Транспорт для передвижения по снегу'),
(6, 'Велосипед', 'Экологически чистый транспорт');

INSERT INTO transport (id, name, human_capacity, luggage_volume, price, transport_type_id) VALUES
(1, 'Седан', 4, 0.5, 1500.0, 1),
(2, 'Хэтчбек', 4, 0.6, 1600.0, 1),
(3, 'Купе', 2, 0.4, 1800.0, 1),
(4, 'Внедорожник малый', 5, 0.7, 2000.0, 2),
(5, 'Внедорожник средний', 7, 0.9, 2500.0, 2),
(6, 'Внедорожник большой', 8, 1.2, 3000.0, 2),
(7, 'Мини-автобус', 15, 2.0, 3500.0, 3),
(8, 'Средний автобус', 30, 4.0, 5000.0, 3),
(9, 'Большой автобус', 50, 6.0, 6500.0, 3),
(10, 'Моторная лодка', 4, 0.8, 3000.0, 4),
(11, 'Гребная лодка', 2, 0.4, 1500.0, 4),
(12, 'Яхта', 10, 2.0, 8000.0, 4),
(13, 'Снегоход малый', 1, 0.2, 2000.0, 5),
(14, 'Снегоход средний', 2, 0.4, 2500.0, 5),
(15, 'Снегоход большой', 4, 0.6, 3000.0, 5),
(16, 'Горный велосипед', 1, 0.01, 500.0, 6),
(17, 'FatBike', 1, 0.01, 800.0, 6),
(18, 'Enduro', 1, 0.01, 1000.0, 6);

INSERT INTO control_point (id, lat, long, name, description) VALUES
(1, 43.346715, 42.453511, 'Эльбрус', 'Самая высокая вершина в России и Европе, высота которой составляет 5 642 метра над уровнем моря. Она имеет две вершины – Восточную и Западную, что делает ее двуглавой горой.'),
(2, 43.265785, 42.472760, 'Азау-су', 'Водопад «Азау-су» – это один из самых красивых водопадов в окрестностях Эльбруса. Он расположен на высоте 2500 метров над уровнем моря и окружен живописными горными пейзажами.'),
(3, 43.265701, 42.479480, 'Станция маятниковой канатной дороги Азау', 'Станция скоростного городского транспорта'),
(4, 43.256211, 42.512954, 'Село Терскол', 'Село Терскол, Эльбрусский район, Кабардино-Балкарская Республика'),
(5, 43.250742, 42.577232, 'Байдаевский водопад', ''),
(6, 43.245314, 42.522373, 'Станция Поляна Чегет', 'Станция скоростного городского транспорта'),
(7, 43.245314, 42.522373, 'Станция кресельной канатной дороги Чегет-3', 'Станция скоростного городского транспорта'),
(8, 43.241016, 42.483240, 'Гора Азау-Гитче-Чегет-Карабаши', 'Горная вершина. 3461 метр.'),
(9, 43.223973, 42.494570, 'Озеро Донгуз-Орункель', 'Донгуз-Орункель - уникальное озеро, спрятанное среди степей и холмов, поражает своей красотой и таинственностью.'),
(10, 43.255094, 42.644153, 'Село Эльбрус', 'Село Эльбрус, Эльбрусский район, Кабардино-Балкарская Республика'),
(11, 43.278475, 42.688446, 'Село Нейтрино', 'Село Нейтрино, Эльбрусский район, Кабардино-Балкарская Республика'),
(12, 43.325677, 42.674055, 'Озеро Сылтранкель', 'Живописный горный водоем, расположенный на высоте 3440 метров над уровнем моря в окружении величественных вершин Кавказских гор, является одним из популярных туристических направлений в Приэльбрусье.'),
(13, 43.278285, 42.461530, 'Водопад Сарыкая-су', 'Живописный водопад в национальном парке, известный своими уникальными геологическими образованиями и каскадами бурлящей воды.'),
(14, 43.273888, 42.460721, 'Станция гондольной канатной дороги Старый Кругозор 3000 м', 'Станция скоростного городского транспорта'),
(15, 43.288973, 42.460786, 'Станция маятниковой канатной дороги Мир 3500 м', 'Станция скоростного городского транспорта'),
(16, 43.288973, 42.460786, 'Станция Гарабаши', 'Станция скоростного городского транспорта'),
(17, 43.315752, 42.458880, 'Мир-3', 'Смотровая площадка');

