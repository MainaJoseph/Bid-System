 <!-- Masthead-->
        <header class="masthead" style="background: rgb(131,58,180);
background: linear-gradient(90deg, rgba(131,58,180,1) 0%, rgba(0,141,245,1) 37%, rgba(29,225,253,1) 64%, rgba(252,176,69,1) 94%);">
            <div class="container h-100" >
                <div class="row h-100 align-items-center justify-content-center text-center" >
                    <div class="col-lg-10 align-self-end mb-4" style="background: rgb(10,10,10);
background: linear-gradient(225deg, rgba(10,10,10,1) 10%, rgba(38,34,69,1) 25%, rgba(38,8,38,1) 77%, rgba(0,69,255,1) 96%);">
                    	 <h1 class="text-uppercase text-white font-weight-bold">About Us</h1>
                        <hr class="divider my-4" />
                    </div>
                    
                </div>
            </div>
        </header>

    <section class="page-section">
        <div class="container">
    <?php echo html_entity_decode($_SESSION['system']['about_content']) ?>        
            
        </div>
        </section>