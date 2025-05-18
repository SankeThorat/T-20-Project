use t20 ;
# Batting Performance Analysis # 

# 1.Which batsman scored the highest runs in a match? #
select batsmanName ,
	   max(runs) as Most_Runs
	   from batting_summary
	   group by batsmanName 
	   order by Most_Runs desc;
        
# 2. Average strike rate of batsmen in a given match
SELECT matchID,
       AVG(SR) as avg_strike_rate 
       FROM batting_summary 
       GROUP BY matchID;

# 3. Number of batsmen with strike rate above 150 in a match
SELECT matchID, 
       COUNT(batsmanName) as batsmen_above_150 
       FROM batting_summary 
       WHERE SR > 150 
       GROUP BY matchID
       order by batsmen_above_150 desc;

# 4. Batsman who faced the most balls in a single match  
SELECT matchID, 
       batsmanName, 
       MAX(balls) as max_balls 
       FROM batting_summary 
       GROUP BY matchID , batsmanName
       order by max_balls desc;

# 5. Batsman who hit the most sixes in a match 
SELECT matchID, 
       batsmanName, 
       MAX(6s) as most_sixes 
       FROM batting_summary 
       GROUP BY matchID ,batsmanName
       order by most_sixes desc ; 

# 6. Number of batsmen who remained not out in a match * 
SELECT matchID,
       COUNT(batsmanName) as not_out_batsmen
       FROM batting_summary
       WHERE "Out/Not_Out" = 'Not Out' 
       GROUP BY matchID , batsmanName;

# 7. Batting position with highest average score
SELECT battingPos,
       AVG(runs) as avg_runs 
       FROM batting_summary 
       GROUP BY battingPos 
       ORDER BY avg_runs DESC 
       LIMIT 1;

# 8. Total number of boundaries (fours and sixes) hit by each team in a match
SELECT matchID, 
       teamInnings, SUM(4s + 6s) as total_boundaries 
       FROM batting_summary 
       GROUP BY matchID, teamInnings 
       order by total_boundaries desc;

# 9. Average runs per over for a team in a match
SELECT matchID, 
	   teamInnings, 
       (SUM(runs) / (SUM(balls) / 6)) as avg_runs_per_over 
       FROM batting_summary 
       GROUP BY matchID, teamInnings
       order by avg_runs_per_over desc;

# 10. Number of batsmen who scored more than 30 runs in a match
SELECT matchID, 
       COUNT(batsmanName) as batsmen_above_30 
       FROM batting_summary 
       WHERE runs > 30 GROUP BY matchID
       order by batsmen_above_30 desc ;

# 11. Bowler who took the most wickets in a match 
SELECT matchID, 
       bowlerName, 
       MAX(wickets) as most_wickets 
       FROM bowling_summary
       GROUP BY matchID , bowlerName
       order by most_wickets desc ;

# 12. Economy rate of each bowler in a match
SELECT matchID, 
       bowlerName,
       economy 
       FROM bowling_summary;

# 13. Bowler with the highest number of dot balls in a match 
SELECT matchID, 
       bowlerName, 
       MAX(0s) as most_dot_balls 
       FROM bowling_summary 
       GROUP BY bowlerName , matchID
       order by most_dot_balls desc ;

# 14. Number of bowlers who conceded more than 40 runs in a match
SELECT matchID, 
       COUNT(bowlerName) as bowlers_above_40 
       FROM bowling_summary 
       WHERE runs > 40 
       GROUP BY matchID ;
      

# 15. Bowlers with the best bowling average in a match
SELECT matchID, 
       bowlerName, 
       (runs / wickets) as bowling_avg 
       FROM bowling_summary 
       WHERE wickets > 0 
       ORDER BY bowling_avg ASC ;
      

# 16. Bowler who bowled the most maiden overs in a match 
 SELECT matchID,
	bowlerName,
    max(maiden) as most_maidens
    FROM bowling_summary
    GROUP BY bowlerName ,
            matchID
            order by most_maidens desc;
            

# 17. Bowler with the lowest economy rate in a match 
select bowlerName ,
       min(economy) , 
       matchID
       from bowling_summary 
       group by bowlerName , matchID;


# 18. Team that won the most matches in a tournament
SELECT winner,
       COUNT(winner) as matches_won 
       FROM match_data 
       GROUP BY winner 
       ORDER BY matches_won DESC 
       LIMIT 1;

# 19. Highest margin of victory in the dataset
SELECT matchID, winner, margin 
       FROM match_data 
       ORDER BY margin DESC 
       LIMIT 1;

# 20. Number of matches won by a margin of fewer than 10 runs or 2 wickets
SELECT COUNT(matchID) as close_matches 
	FROM match_data 
    WHERE margin LIKE '% runs' AND CAST(SUBSTRING_INDEX(margin, ' ', 1) AS UNSIGNED) < 10 
    OR margin LIKE '% wickets' AND CAST(SUBSTRING_INDEX(margin, ' ', 1) AS UNSIGNED) < 2;

         
          