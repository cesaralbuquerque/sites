<div class="stats-panel" id="panel-<?php the_ID(); ?>">
    <div class="statsinner row">
    	<div class="inner">
            <header>
                <h2 class="title"><?php the_title(); ?></h2>
            </header>


            <?php

           	// Get Stat entries, this is a repeatable group so we need it in a loop.
           	// If no icon is selected, we clear the HTML for the FA icon.

            $entries = get_post_meta( get_the_ID(), '_wearesupa_repeat_group', true );

            foreach ( (array) $entries as $key => $entry ) {

                if ( isset( $entry['title'] ) ) {
                    $title = esc_html( $entry['title'] );
            	}

            	if ( isset( $entry['number'] ) ) {
            	    $number = esc_html( $entry['number'] );
            	}

            	if ( isset( $entry['icon'] ) ) {
            	    $icon = esc_html( $entry['icon'] );
            	}


            ?>
            <div class="stats">
            	<span class="timer" data-from="0" data-to="<?php echo $number; ?>" data-speed="3000" data-refresh-interval="50"><?php echo $number; ?></span>
            		<?php if ( $icon !== 'none' ) { ?><i class="fa <?php echo $icon; ?>"></i> <?php } ?><?php echo $title; ?>
            </div>


            <?php }

            ?>


    	</div>
    </div>
</div>
