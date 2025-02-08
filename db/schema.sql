CREATE TABLE IF NOT EXISTS contributions (
    date TEXT PRIMARY KEY CHECK(date IS strftime('%Y-%m-%d', date)),
    count INTEGER NOT NULL,
    level INTEGER NOT NULL CHECK(level BETWEEN 1 AND 4)
);
