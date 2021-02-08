<?php
/**
 * Configuración básica de WordPress.
 *
 * Este archivo contiene las siguientes configuraciones: ajustes de MySQL, prefijo de tablas,
 * claves secretas, idioma de WordPress y ABSPATH. Para obtener más información,
 * visita la página del Codex{@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} . Los ajustes de MySQL te los proporcionará tu proveedor de alojamiento web.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** Ajustes de MySQL. Solicita estos datos a tu proveedor de alojamiento web. ** //
/** El nombre de tu base de datos de WordPress */
define( 'DB_NAME', 'wordpress' );

/** Tu nombre de usuario de MySQL */
define( 'DB_USER', 'kriosfu' );

/** Tu contraseña de MySQL */
define( 'DB_PASSWORD', 'kriosfu' );

/** Host de MySQL (es muy probable que no necesites cambiarlo) */
define( 'DB_HOST', 'mysql' );

/** Codificación de caracteres para la base de datos. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Cotejamiento de la base de datos. No lo modifiques si tienes dudas. */
define('DB_COLLATE', '');

/**#@+
 * Claves únicas de autentificación.
 *
 * Define cada clave secreta con una frase aleatoria distinta.
 * Puedes generarlas usando el {@link https://api.wordpress.org/secret-key/1.1/salt/ servicio de claves secretas de WordPress}
 * Puedes cambiar las claves en cualquier momento para invalidar todas las cookies existentes. Esto forzará a todos los usuarios a volver a hacer login.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '+3PV%p7MsrC@~>|t3lS)X+Q|RM]SOR~|2Xzo&z[8fFT1+qPS[r3+H&Su-RnAmhQF');
define('SECURE_AUTH_KEY',  '|[vtG-YF$Hs3,Z-dP;<br#wAvCv6#+PF&imA3G%{vp4;l0F&!uH(_St(sspS@zl>');
define('LOGGED_IN_KEY',    '4!N6E5=Fylfv9)ApHvio:wH-/d/aw=W8ja !M-:|;TB;:ARlIH,zQx/H5+Vc& ]U');
define('NONCE_KEY',        '{ube5PQRmicaS;Io#i(-K+Gq:EHUm[2mnFxm]`[U?T!Gu4:Axy <%hY2,+o}.f[a');
define('AUTH_SALT',        '$3%_%k~7a~S[!N9oUQg>v^So?{*CzTY>lfY(]!={AR^2r6Bt]#j~oLIYzeD5%7H]');
define('SECURE_AUTH_SALT', 'dl]-}t<lR>#IG=#pV+&w!x(ktPF`bK@N<+hvN6y,-;IK[Vq?Q]9%H|s`*`&T~^2R');
define('LOGGED_IN_SALT',   'N>(]q+LAX_nCy15@v6Ple{hHLTf76<*d3y/([75{JBWv-|Igw|}bl+9m^w:MK;Y[');
define('NONCE_SALT',       'ZSk2AkYTo_}g@}IxQut+x/Lt2A$~n.;Z-WC/TL_vt.LK4?iy`9^A?K?!tU9jY)(N');

/**#@-*/

/**
 * Prefijo de la base de datos de WordPress.
 *
 * Cambia el prefijo si deseas instalar multiples blogs en una sola base de datos.
 * Emplea solo números, letras y guión bajo.
 */
$table_prefix = 'wp_';


/**
 * Para desarrolladores: modo debug de WordPress.
 *
 * Cambia esto a true para activar la muestra de avisos durante el desarrollo.
 * Se recomienda encarecidamente a los desarrolladores de temas y plugins que usen WP_DEBUG
 * en sus entornos de desarrollo.
 */
define('WP_DEBUG', false);

/* ¡Eso es todo, deja de editar! Feliz blogging */

/** WordPress absolute path to the Wordpress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');