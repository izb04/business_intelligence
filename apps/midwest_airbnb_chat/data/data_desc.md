# Midwest Airbnb data dictionary

One row of `listings` represents a listing in a July 2026 city snapshot. The supplied SQLite table has 14,887 rows and 29 columns. Types, examples, ranges, and totals below were checked against this database.

| City | Snapshot date | Listings |
| --- | --- | ---: |
| Chicago | 2026-07-20 | 7,439 |
| Columbus | 2026-07-23 | 2,587 |
| Twin Cities | 2026-07-21 | 4,861 |

| Column | SQLite type | Meaning | Observed examples or range |
| --- | --- | --- | --- |
| `city` | TEXT | Course dataset city or region. | Chicago; Columbus; Twin Cities |
| `snapshot_date` | TEXT | City snapshot date, YYYY-MM-DD. | 2026-07-20; 2026-07-23; 2026-07-21 |
| `id` | TEXT | Listing ID; keep as text to preserve precision. | 2384; 7126; 10945 |
| `name` | TEXT | Accommodation listing title. | Hyde Park: 5 minute walk to Obama Presidential Ctr; Tiny Studio Apartment 94 Walk Score; The Biddle House (#1) |
| `host_id` | TEXT | Host ID; a host can have several listings. | 2613; 17928; 33004 |
| `host_name` | TEXT | Displayed host name. | Rebecca; Sarah; Elizabeth |
| `host_since` | TEXT | Account creation date; may precede hosting. |  |
| `host_is_superhost` | TEXT | Superhost flag: t=yes, f=no, NULL=unknown. | t; f |
| `neighbourhood` | TEXT | Neighbourhood label; compare within city. | Hyde Park; West Town; Lincoln Park |
| `latitude` | REAL | Approximate latitude in degrees. | 39.8753494 to 46.24415 |
| `longitude` | REAL | Approximate longitude in degrees. | -94.52678887596865 to -82.7809534 |
| `property_type` | TEXT | Property category. | Private room in condo; Entire rental unit; Room in boutique hotel |
| `room_type` | TEXT | Space category; entire homes use Entire home/apt. | Private room; Entire home/apt; Shared room |
| `accommodates` | INTEGER | Guest capacity; does not establish party permission. | 1 to 16 |
| `bedrooms` | REAL | Bedroom count; stored as REAL. | 1.0 to 16.0 |
| `beds` | REAL | Bed count; stored as REAL. | 1.0 to 32.0 |
| `bathrooms_text` | TEXT | Bathroom description, including shared/private qualifiers. | 1 shared bath; 1 bath; 1 private bath |
| `price` | REAL | Nightly advertised USD price, converted to numeric. | 2.56 to 11412.0 |
| `minimum_nights` | INTEGER | Minimum stay in nights. | 1 to 365 |
| `availability_365` | INTEGER | Available nights in the next year; unavailable can mean booked or blocked. | 0 to 365 |
| `number_of_reviews` | INTEGER | All recorded reviews. | 0 to 2246 |
| `number_of_reviews_ltm` | INTEGER | Reviews over the preceding twelve months. | 0 to 1220 |
| `first_review` | TEXT | Earliest review date. | 2015-01-09; 2009-07-03; 2014-04-28 |
| `last_review` | TEXT | Latest review date. | 2026-06-08; 2026-06-30; 2026-06-21 |
| `review_scores_rating` | REAL | Overall rating; observed scale is 1–5. | 1.0 to 5.0 |
| `reviews_per_month` | REAL | Average monthly review frequency. | 0.01 to 77.72 |
| `instant_bookable` | TEXT | Immediate booking flag: t=yes, f=no, NULL=unknown. |  |
| `estimated_revenue_l365d` | REAL | Modeled USD revenue over the previous 365 days; not observed earnings. The formula is not supplied. | 0.0 to 1114800.0 |
| `amenities_count` | INTEGER | Count of amenities; individual amenities are absent. | 0 to 100 |

## Interpretation

NULL is missing, not zero. SQL AVG skips NULL; report COUNT(price) as well as COUNT(*) for price comparisons. IDs and dates are text. These are historical snapshots, not live booking offers. Price extremes are retained and can affect means. Coordinates are approximate.

Course-added fields include city, snapshot_date, and amenities_count. This table does not contain calendar-level prices, party permissions, individual amenities, or the revenue estimation formula.

## Sources

- [Inside Airbnb dictionary](https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit)
- [Inside Airbnb downloads](https://insideairbnb.com/get-the-data/)
- [Inside Airbnb assumptions](https://insideairbnb.com/data-assumptions/)
- Supplied course database: actual schema, dates, totals, examples, and numeric ranges.
