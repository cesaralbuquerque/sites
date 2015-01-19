<?php
/** 
 * As configurações básicas do WordPress.
 *
 * Esse arquivo contém as seguintes configurações: configurações de MySQL, Prefixo de Tabelas,
 * Chaves secretas, Idioma do WordPress, e ABSPATH. Você pode encontrar mais informações
 * visitando {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. Você pode obter as configurações de MySQL de seu servidor de hospedagem.
 *
 * Esse arquivo é usado pelo script ed criação wp-config.php durante a
 * instalação. Você não precisa usar o site, você pode apenas salvar esse arquivo
 * como "wp-config.php" e preencher os valores.
 *
 * @package WordPress
 */

// ** Configurações do MySQL - Você pode pegar essas informações com o serviço de hospedagem ** //
/** O nome do banco de dados do WordPress */
define('DB_NAME', 'db_irma');

/** Usuário do banco de dados MySQL */
define('DB_USER', 'admin');

/** Senha do banco de dados MySQL */
define('DB_PASSWORD', 'admin');

/** nome do host do MySQL */
define('DB_HOST', 'localhost');

/** Conjunto de caracteres do banco de dados a ser usado na criação das tabelas. */
define('DB_CHARSET', 'utf8');

/** O tipo de collate do banco de dados. Não altere isso se tiver dúvidas. */
define('DB_COLLATE', '');

/**#@+
 * Chaves únicas de autenticação e salts.
 *
 * Altere cada chave para um frase única!
 * Você pode gerá-las usando o {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * Você pode alterá-las a qualquer momento para desvalidar quaisquer cookies existentes. Isto irá forçar todos os usuários a fazerem login novamente.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '<g 1UTTJ}W6~rXd4.2S3Gk$N1swqhRQ^RZzZBgA&h$Yx%4+l7?PY%Y^S|)Z];s%e');
define('SECURE_AUTH_KEY',  ' -W|9~0`xLIk#x&@/Nfb,Q2+kP-|koNCC<~cX~yB++;}wqxvR]r>s;!>rd6-3`%<');
define('LOGGED_IN_KEY',    '!4loa|G7W52ikGP2v)V|Sxc~HH0-L}.er~0x7%]`>&++GdY~LL:6uBsL@NjT9 Aq');
define('NONCE_KEY',        '}GX/w7n4xY-+%}]Z-R:k{/XI8r|QN9?iWLD(SeRpTVM$QTv_shSSpg&zgx1K 4-#');
define('AUTH_SALT',        '0;l)hn0+y&67D}$U1W>}_g-IJeoHUJ.<<-zCD&)LjHF53SD!,#Up!dqDM=C~Y|?,');
define('SECURE_AUTH_SALT', '0oO+#|Z|s;X>_ye~y8@=UPbqb>6QN xh{0[X&insX#@f?t-XNZ8y.W+P [w4FXU)');
define('LOGGED_IN_SALT',   'LIp8~kB?CvUGrmj00:sv!5B@ SYPxDdev:zhC lI|Lar|jpPx/(|9Li>qN!fzYa<');
define('NONCE_SALT',       '2&)d:Fle 8t9Z=oHi-Kug}V#=,c%++Lm;f.GJvZuG+pV~q!(rosdEQm+U?|.=LG!');

/**#@-*/

/**
 * Prefixo da tabela do banco de dados do WordPress.
 *
 * Você pode ter várias instalações em um único banco de dados se você der para cada um um único
 * prefixo. Somente números, letras e sublinhados!
 */
$table_prefix  = 'wp_';


/**
 * Para desenvolvedores: Modo debugging WordPress.
 *
 * altere isto para true para ativar a exibição de avisos durante o desenvolvimento.
 * é altamente recomendável que os desenvolvedores de plugins e temas usem o WP_DEBUG
 * em seus ambientes de desenvolvimento.
 */
define('WP_DEBUG', false);

/* Isto é tudo, pode parar de editar! :) */

/** Caminho absoluto para o diretório WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
	
/** Configura as variáveis do WordPress e arquivos inclusos. */
require_once(ABSPATH . 'wp-settings.php');
