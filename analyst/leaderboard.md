``` sql
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 
```


``` sql
SELECT person_id, count(*) AS leaderboard_count FROM comments GROUP BY person_id ORDER BY leaderboard_count LIMIT 10

SELECT leaders.*, CAST(@rnk:=@rnk+1 AS UNSIGNED) leaderboard_rank
FROM (<top-sql>) AS leaders, (SELECT @rnk:=0) AS ranking

SELECT leaderboard_rank, p.email, leaderboard_count FROM <top-sql> LEFT JOIN people p ON p.id = person_id WHERE p.email = ?
```



