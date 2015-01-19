<?php

	// Set up post class
	$postClass = "row triangletop post";

	// If no featured image add no-image class
	if ( !has_post_thumbnail() ) {
		$postClass = "row triangletop post no-image";
	 }

 ?>

<!-- Article -->
<article <?php post_class($postClass); ?>>

	<?php
	// Load widgets
	if (!function_exists('dynamic_sidebar') || !dynamic_sidebar('Ad Space (Header)')) {
	} ?>

	<!-- Article Header -->
	<header>
		<h1 class="title entry-title post-title"><?php the_title(); ?></h1>
	</header>
	<!--/ Article Header -->

	<!-- Article content 3-->
	<div class="col span3of3">
		<div class="inner" id="aqui">
		<?php the_content(); 
		
		
			$page_data = get_page( $page_id );
			
			//EMPREENDIMENTOS
			if($page_data->ID == 256){
			
				//MEIOS DE HOSPEDAGEM
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>22, 'cat'=>52, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="col span3of3">
				  <h2 class="title searching"> Meios de Hospedagens </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=52");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(52); ?>" class="btn clear">+ MEIOS DE HOSPEDAGENS</a>
						<?php
					}
				}
				
		?>		
		</div>
		<BR>
		<BR>
		<div class="inner" id="aqui">
		<?php
				//RESTAURANTES
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>22, 'cat'=>53, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="col span3of3">
				  <h2 class="title searching"> Restaurantes </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=3");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(53); ?>" class="btn clear">+ RESTAURANTES</a>
						<?php
					}
				}
		?>
		</div>
		<BR>
		<BR>
		<div class="inner" id="aqui">
		<?php
				//OUTROS
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>22, 'cat'=>54, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="col span3of3">
				  <h2 class="title searching"> Outros </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=54");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(54); ?>" class="btn clear">+ OUTROS</a>
						<?php
					}
				}				
			
				//echo '<h3>'. $page_data->post_title .'</h3>';
			}
			
			//VIDEOS
			if($page_data->ID == 352){
			
				//BC-itajai
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>2, 'cat'=>39, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
			   
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Balneário Camboriú / Itajaí </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=39");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(39); ?>" class="btn clear">+ VIDEOS Balneário Camboriú / Itajaí</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}
		
				//Blumenau
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>2, 'cat'=>40, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Blumenau </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=40");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(40); ?>" class="btn clear">+ VIDEOS Blumenau</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}

				//Costa Esmeralda
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>2, 'cat'=>41, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Costa Esmeralda </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=41");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(41); ?>" class="btn clear">+ VIDEOS Costa Esmeralda</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}	
		
				//Farol de Santa Marta / Laguna
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>2, 'cat'=>42, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Farol de Santa Marta / Laguna </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=42");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(42); ?>" class="btn clear">+ VIDEOS Farol de Santa Marta / Laguna</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php					
				}
				
				//Ferrugem / Garopaba / Rosa
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>2, 'cat'=>43, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Ferrugem / Garopaba / Rosa </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=43");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(43); ?>" class="btn clear">+ VIDEOS Ferrugem / Garopaba / Rosa</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}		
				
				//Florianópolis
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>2, 'cat'=>44, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Florianópolis </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=44");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(44); ?>" class="btn clear">+ VIDEOS Florianópolis</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}		
				
				//São Joaquim / Urubici
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>2, 'cat'=>45, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> São Joaquim / Urubici </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=45");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(45); ?>" class="btn clear">+ VIDEOS São Joaquim / Urubici</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}

				//echo '<h3>'. $page_data->post_title .'</h3>';
			}
			
			//ROTEIROS
			if($page_data->ID == 354){
			
				//Ecoturismo
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>27, 'cat'=>46, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
			   
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Ecoturismo </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=46");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(46); ?>" class="btn clear">+ VIDEOS Ecoturismo</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}
		
				//Turismo Cultural
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>27, 'cat'=>47, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Turismo Cultural </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=47");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(47); ?>" class="btn clear">+ VIDEOS Turismo Cultural</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}

				//Turismo Comunitário
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>27, 'cat'=>48, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Turismo Comunitário </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=48");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(48); ?>" class="btn clear">+ VIDEOS Turismo Comunitário</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}	
		
				//Turismo Religioso
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>27, 'cat'=>49, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Turismo Religioso </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=49");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(49); ?>" class="btn clear">+ VIDEOS Turismo Religioso</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php					
				}
				
				//Turismo Rural
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>27, 'cat'=>50, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Turismo Rural </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=50");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(50); ?>" class="btn clear">+ VIDEOS Turismo Rural</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}		
				
				//Turismo de Experiência
				$wp_query = new WP_Query();
				$my_query = new WP_Query(array( 'cat'=>27, 'cat'=>51, 'posts_per_page'=>3) );

			   if ( $my_query->have_posts() ) {
				  ?> 
				  <div class="inner" id="aqui">
					  <div class="col span3of3">
					  <h2 class="title searching"> Turismo de Experiência </h2></div><?php
				   while ( $my_query->have_posts() ) {
					   $my_query->the_post();
					   if(!get_post_format()) {
							get_template_part('post-formats/content');
						} else {
							get_template_part('post-formats/content', get_post_format());
						}
					}
					$my_query = new WP_Query( "cat=51");
					if($my_query->post_count > 3){ 
						?>
						<a href="<?php echo $category_link = get_category_link(51); ?>" class="btn clear">+ VIDEOS Turismo de Experiência</a>
						<?php
					}
					?>		
					</div>
					<BR>
					<?php
				}		
			}	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			return;
		
		?>
		</div>
		<?php wp_link_pages( array( 'before' => '<nav class="pagination">' . __( '<span>Pages:</span>', 'wearesupa' ), 'after' => '</nav>' ) ); ?>
	</div>

	<?php
	// Load widgets
	if (!function_exists('dynamic_sidebar') || !dynamic_sidebar('Ad Space (Footer)')) {
	} ?>
</article>
