var fastViewHandlers = function() {
	Layout.initTouchspin();
	Layout.initImageZoom();
	var radios, selectedRadio;
	Spree.addImageHandlers = function() {
	  var thumbnails;
	  thumbnails = $('.product-images ul.thumbnails');
	  ($('.product-main-image')).data('selectedThumb', ($('.product-main-image img')).attr('src'));
	  thumbnails.find('li').eq(0).addClass('selected');
	  thumbnails.find('a').on('click', function(event) {
		($('.product-main-image')).data('selectedThumb', ($(event.currentTarget)).attr('href'));
		($('.product-main-image')).data('selectedThumbId', ($(event.currentTarget)).parent().attr('id'));
		thumbnails.find('li').removeClass('selected');
		($(event.currentTarget)).parent('li').addClass('selected');
		Layout.initImageZoom();
		return false;
	  });
	  thumbnails.find('li').on('mouseenter', function(event) {
		($('.product-main-image img')).attr('src', ($(event.currentTarget)).find('a').attr('href'));
		Layout.initImageZoom();
		return false;
	  });
	  thumbnails.find('li').on('mouseleave', function(event) {
		($('.product-main-image img')).attr('src', ($('.product-main-image')).data('selectedThumb'));
		Layout.initImageZoom();
		return false;
	  });
	};
	Spree.showVariantImages = function(variantId) {
	  var currentThumb, newImg, thumb;
	  ($('li.vtmb')).hide();
	  ($('li.tmb-' + variantId)).show();
	  currentThumb = $('#' + ($('.product-main-image')).data('selectedThumbId'));
	  if (!currentThumb.hasClass('vtmb-' + variantId)) {
		thumb = $(($('#product-images ul.thumbnails li:visible.vtmb')).eq(0));
		if (!(thumb.length > 0)) {
		  thumb = $(($('#product-images ul.thumbnails li:visible')).eq(0));
		}
		newImg = thumb.find('a').attr('href');
		($('#product-images ul.thumbnails li')).removeClass('selected');
		thumb.addClass('selected');
		($('.product-main-image img')).attr('src', newImg);
		($('.product-main-image')).data('selectedThumb', newImg);
		return ($('.product-main-image')).data('selectedThumbId', thumb.attr('id'));
	  }
	};
	Spree.updateVariantPrice = function(variant) {
	  var variantPrice;
	  variantPrice = variant.data('price');
	  if (variantPrice) {
		return ($('.price.selling')).text(variantPrice);
	  }
	};
	radios = $('#product-variants input[type="radio"]');
	if (radios.length > 0) {
	  selectedRadio = $('#product-variants input[type="radio"][checked="checked"]');
	  Spree.showVariantImages(selectedRadio.attr('value'));
	  Spree.updateVariantPrice(selectedRadio);
	}
	Spree.addImageHandlers();
	return radios.click(function(event) {
	  Spree.showVariantImages(this.value);
	  return Spree.updateVariantPrice($(this));
	});
};
