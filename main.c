#include <mysql/mysql.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    MYSQL *conn;
    MYSQL_RES *res;
    MYSQL_ROW row;
    char *server = "localhost";
    char *user = "root";  // Replace "root" with your MySQL username
    char *password = "password";  // Replace with your MySQL password
    char *database = "Game";  // The database you are using

    conn = mysql_init(NULL);

    // Connecting to database
    if (conn == NULL) {
        fprintf(stderr, "mysql_init() failed\n");
        return EXIT_FAILURE;
    }

    if (mysql_real_connect(conn, server, user, password, database, 0, NULL, 0) == NULL) {
        fprintf(stderr, "mysql_real_connect() failed\n");
        mysql_close(conn);
        return EXIT_FAILURE;
    }

    // Executing the query to retrieve the winner or the points from a specific game
    if (mysql_query(conn, "SELECT Player.Name, PlayerGames.PointsGame "
                          "FROM Player "
                          "JOIN PlayerGames ON Player.Id = PlayerGames.Player "
                          "JOIN Games ON PlayerGames.Games = Games.Id "
                          "WHERE Games.Id = 1;")) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        mysql_close(conn);
        return EXIT_FAILURE;
    }

    res = mysql_store_result(conn);

    if (res == NULL) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        mysql_close(conn);
        return EXIT_FAILURE;
    }

    // Printing the players and their points
    printf("Players in game 1 and their points:\n");
    while ((row = mysql_fetch_row(res)) != NULL) {
        printf("Player: %s, Points: %s\n", row[0], row[1]);
    }

    mysql_free_result(res);
    mysql_close(conn);

    return EXIT_SUCCESS;
}
