CREATE TABLE IF NOT EXISTS schema_info (
    version INTEGER PRIMARY KEY,
    updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS contributions (
    date TEXT PRIMARY KEY CHECK(date IS strftime('%Y-%m-%d', date)),
    count INTEGER NOT NULL,
    level INTEGER NOT NULL CHECK(level BETWEEN 0 AND 4)
);

INSERT OR IGNORE INTO schema_info (version) VALUES (1);
