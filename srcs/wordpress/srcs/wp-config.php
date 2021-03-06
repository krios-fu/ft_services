<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'kriosfu' );

/** MySQL database password */
define( 'DB_PASSWORD', 'kriosfu' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         't$tH^$j>;k-!il H^SaG+wqbnWdtWYlCoszJD5}at<7>aFW}>XuvJ!hf6:KoZpO{' );
define( 'SECURE_AUTH_KEY',  '}l45r gzl~umL XC*1PJcB nk^Kx3xjO2VN98KwsTf<ItPZQcQ+:_-yL$xj|CENC' );
define( 'LOGGED_IN_KEY',    'B%YQ`Wc`.%,1{b$iSbLqPEM<>LZa :}UzCEkgIM(IDN1D/yd3kJ{Ygs:P8|vL2 L' );
define( 'NONCE_KEY',        '{Cgh8JAAOh G>IS?qPw9gsPeo3oVTL6dTq(8rT]JKQq{V!YrUh,X.7TVy5p:SafW' );
define( 'AUTH_SALT',        'Dtp[^n/azsP2.WZ%*r MlMWDpb9/{9 S6AB|rr*2.~$YV1|A[&&rvN6_(J1=oyr&' );
define( 'SECURE_AUTH_SALT', '>B;?=H0D6j44 :I|B|EGv3RJu4mnAV~.6}Rr~M6iod%XW%vzcyC&DJQ.{}T|Y6]U' );
define( 'LOGGED_IN_SALT',   'g7>s;)KF#`zlItW;])IoozT@!&;l%1~q RiPT0c8I 958>u/&gigQwOyE[Qg#PXV' );
define( 'NONCE_SALT',       'tjQ(h{U?hu5}oUl Ik}e;^lVwj$NX8Y$J|]F~;Nw^+/OL1]M1^i8hS?:%f6/zWsW' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';