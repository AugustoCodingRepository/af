
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./CSS/shopcss.css">
<link rel="stylesheet" href="./CSS/stileRecens.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<link rel="icon" type="image/png" href="IMG/Finale.png">
</head>
<body>
	<jsp:include page="./fragments/header.jsp" />
	<div class="container">
		<div class="title">PRODUCT DETAIL</div>
		<div class="detail">
			<div class="image">
				<img src="">
			</div>
			<div class="content">
				<h1 class="name"></h1>
				<div class="price"></div>
				<div class="buttons">
					<button>Check Out</button>
					<button>
						Add To Cart <span> <svg class="" aria-hidden="true"
								xmlns="http://www.w3.org/2000/svg" fill="none"
								viewBox="0 0 18 20">
                                <path stroke="currentColor"
									stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
									d="M6 15a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm0 0h8m-8 0-1-4m9 4a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm-9-4h10l2-7H3m2 7L3 4m0 0-.792-3H1" />
                            </svg>
						</span>
					</button>
				</div>
				<div class="description"></div>
			</div>
		</div>
		
		
		
	
	<!-- RECENSIONI -->
		<section id="testimonials">

        <!-- Testimonial Box Container -->
        <div class="testimonial-box-container">
            <!-- Testimonial Box -->
            <div class="testimonial-box">
                <!-- Box Top -->
                <div class="box-top">
                    <!-- Profile -->
                    <div class="profile">
                        <!-- Profile Image -->
                        <div class="profile-img">
                            <img src="p1.jpg" alt="Profile Image">
                        </div>
                        <!-- Name and Email -->
                        <div class="name-user">
                            <strong>Federica Iuliano</strong>
                            <span>fedeiuli@gmail.com</span>
                        </div>
                    </div>
                    <!-- Reviews -->
                    <div class="reviews">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </div>
                <!-- Client Comment -->
                <div class="client-comment">
                    <p>Yuki è un cagnolino carino</p>
                </div>
            </div>
        </div>
    </section>
		

	<script>
        let products = null;
        // get datas from file json
        fetch('./products.json')
            .then(response => response.json())
            .then(data => {
                products = data;
                showDetail();
        })

        function showDetail(){
    // remove datas default from HTML
        let detail = document.querySelector('.detail');
        let listProduct = document.querySelector('.listProduct');
        let productId =  new URLSearchParams(window.location.search).get('id');
        let thisProduct = products.filter(value => value.id == productId)[0];
        //if there is no product with id = productId => return to home page
        if(!thisProduct){
            window.location.href = "/";
        }

        detail.querySelector('.image img').src = thisProduct.image;
        detail.querySelector('.name').innerText = thisProduct.name;
        detail.querySelector('.price').innerText = '$' + thisProduct.price;
        detail.querySelector('.description').innerText = '$' + thisProduct.description;


        (products.filter(value => value.id != productId)).forEach(product => {
            let newProduct = document.createElement('a');
            newProduct.href = '/detail.html?id=' + product.id;
            newProduct.classList.add('item');
            newProduct.innerHTML = 
            `<img src="${product.image}" alt="">
            <h2>${product.name}</h2>
            <div class="price">$${product.price}</div>`;
            listProduct.appendChild(newProduct);
        });
    }

    </script>
    	</div>
	<jsp:include page="./fragments/footer.jsp" />
</body>
</html>
