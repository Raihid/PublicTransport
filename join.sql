SELECT station.*, stop.* FROM station INNER JOIN stop ON stop.station = station.id;
SELECT station.*, stop.* FROM station LEFT JOIN stop ON stop.station = station.id;
SELECT station.*, stop.* FROM station RIGHT JOIN stop ON stop.station = station.id;
SELECT * FROM drivers UNION ALL SELECT * FROM vehicles;
