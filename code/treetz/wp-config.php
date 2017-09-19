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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'treetz' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Q.D(jmwWT9|o6KC]0?Bxv[veg{X;# byixd)qcN/7`a$7e.D0,54~wIv52c1J3-9');
define('SECURE_AUTH_KEY',  ' uAlvhZ,+%1bF)KH)ei=~Ur|sq1T`qg~yrM]F=09p[:3v&ts+C7r7O  )4da`2a;');
define('LOGGED_IN_KEY',    '|#B*1D*-K}}x:g-Yo|E4J5Hl:6!)fD||V(e:trrQ^3jqm~37F}tN-h mKJK>C;H.');
define('NONCE_KEY',        '$JNjqzHc4U,B%ZV_RCvklbNA!ts`0*|ShB`%t0zO{$6>L?(Bj7lmk986y#Jmsbws');
define('AUTH_SALT',        '/2!A{NOLZ4s[Q@9eYGo~[||uE^s%)K>!3ReszB?~{@#gF!*WK.|{Te?7X$3|+-F8');
define('SECURE_AUTH_SALT', '7{kPW>;+(Z7K3_sF[aKK&CRo;+%]eJ TPVL{QB{|4ct{Q-w67op#i<rvBnnR<+uS');
define('LOGGED_IN_SALT',   'LsW`J)_ hY3Tsd27CQ1dTw]%c/[lN+eh3 Fc+]Fv[i`Iy20b:Imna3*E;zd8|nWj');
define('NONCE_SALT',       '^??`~mRMqw+CKX52|;RSS=E^texB#vDuOex|?FDdr&Q&M_7n@w`g9Tj(Mr`[L*^&');


/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
