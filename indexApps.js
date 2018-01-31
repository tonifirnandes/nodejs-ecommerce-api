/**
 * Created by CT on 10/11/2017.
 */
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var database = require('./configuration/DB')
var debug = require('debug')('gate:server');
var http = require('http');
var app = express();
var csrf = require('csurf');
var jwt2 = require('jsonwebtoken');
var jwt = require('jwt-simple');
var router = express.Router();
var bcrypt = require('bcryptjs');

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

database.connect(function(err, dbconnection) {
    if (err) {
        console.log(err);
    } else {
        app.use(function(err, req, res, next) {
            res.locals.message = err.message;
            res.locals.error = req.app.get('env') === 'development' ? err : {};
            res.status(err.status || 500);
            res.render('error');
        });

        var port = normalizePort(process.env.PORT || '4444');
        app.set('port', port);
        var server = http.createServer(app);
        server.listen(port);
        server.on('error', onError);
        server.on('listening', onListening);

        function normalizePort(val) {
            var port = parseInt(val, 10);
            if (isNaN(port)) {
                return val;
            }
            if (port >= 0) {
                return port;
            }
            return false;
        }

        function onError(error) {
            if (error.syscall !== 'listen') {
                throw error;
            }

            var bind = typeof port === 'string' ?
                'Pipe ' + port :
                'Port ' + port;

            switch (error.code) {
                case 'EACCES':
                    console.error(bind + ' requires elevated privileges');
                    process.exit(1);
                    break;
                case 'EADDRINUSE':
                    console.error(bind + ' is already in use');
                    process.exit(1);
                    break;
                default:
                    throw error;
            }
        }

        function onListening() {
            var addr = server.address();
            var bind = typeof addr === 'string' ?
                'pipe ' + addr :
                'port ' + addr.port;
            debug('Listening on ' + bind);
        }

        module.exports = app;
        app.db = dbconnection;
        var newsletter = require('./qmallstore/newsletter/newsletterRoute');
        var faq = require('./qmallstore/faq/defaultFaq/faqRoute');
        var advertisement = require('./qmallstore/homepage/advertisement/advertisementRoute');
        var promo = require('./qmallstore/homepage/promo/promoRoute');
        var topSelling = require('./qmallstore/homepage/topProduct/bySelling/topSellingRoute');
        var topViewing = require('./qmallstore/homepage/topProduct/byViewing/topViewingRoute');
        var byCategory = require('./qmallstore/homepage/product/byCategory/byCategoryRoute');
        var byPartNumber = require('./qmallstore/homepage/product/byPartNumber/byPartNumberRoute');
        var byBrand = require('./qmallstore/homepage/product/byBrand/byBrandRoute');
        var allProduct = require('./qmallstore/homepage/product/allProduct/allProductRoute');
        var brandList = require('./qmallstore/homepage/brand/brandListRoute');
        var categorybybrandList = require('./qmallstore/homepage/categoryByBrand/categoryByBrandRoute');
        var insertSubscribeEmail = require('./qmallstore/subcribe/subscribeEmailRoute');
        var registercustomer = require('./qmallstore/customerAccount/register/registerRoute');
        var province = require('./qmallstore/indonesianGeographic/province/provinceRoute');
        var regency = require('./qmallstore/indonesianGeographic/regency/regencyRoute');
        var district = require('./qmallstore/indonesianGeographic/district/districtRoute');
        var village = require('./qmallstore/indonesianGeographic/village/villageRoute');
        var allBrandAllCategory = require('./qmallstore/homepage/product/allBrandAllCategory/allBrandAllCategoryRoute');
        var personalInfo = require('./qmallstore/customerAccount/personalInfo/personalInfoRoute');
        var otpcode = require('./qmallstore/customerAccount/otpCode/checkOtp/checkOtpRoute');
        var resendcode = require('./qmallstore/customerAccount/otpCode/resendCode/resendCodeRoute');
        var contactForm = require('./qmallstore/contactForm/contactFormRoute');
        var loginCustomer = require('./qmallstore/customerAccount/login/loginCustomerRoute');
        var faqLike = require('./qmallstore/faq/faqLike/faqLikeRoute');
        var faqDislike = require('./qmallstore/faq/faqDislike/faqDislikeRoute');
        var faqWaitingList = require('./qmallstore/faq/faqWaitingList/faqWaitingListRoute');
        var searchByBrand = require('./qmallstore/search/searchByBrand/searchByBrandRoute');
        var searchByPartNumber = require('./qmallstore/search/searchByPartNumber/searchByPartNumberRoute');
        var partNumberName = require('./qmallstore/search/searchPartNumberName/partNumberNameRoute');
        var emailForgotPassword = require('./qmallstore/customerAccount/forgotPassword/verifyEmail/verifyEmailRoute');
        var resetPassword = require('./qmallstore/customerAccount/forgotPassword/resetPassword/resetPasswordRoute');
        var noLimit = require('./qmallstore/search/searchNoLimit/noLimitRoute');
        var limit = require('./qmallstore/search/searchLimit/limitRoute');
        var productInfo = require('./qmallstore/productDetail/productInfo/productInfoRoute');
        var productInquiry = require('./qmallstore/productDetail/productInquiry/productInquiryRoute');
        var cartAdd = require('./qmallstore/transaction/cart/cartAdd/cartAddRoute');
        var cartShow = require('./qmallstore/transaction/cart/cartShow/cartShowRoute');
        var cartDelete = require('./qmallstore/transaction/cart/cartDelete/cartDeleteRoute');
        var orderProduct = require('./qmallstore/transaction/orderProduct/orderProductRoute');
        var orderPayment = require('./qmallstore/transaction/orderPayment/orderPaymentRoute');
        var orderShipment = require('./qmallstore/transaction/orderShipment/orderShipmentRoute');
        var searchProduct = require('./qmallstore/search/searchProduct/searchProductRoute');
        app.get('/', function(req, res) {
            res.sendfile('index.html', { root: __dirname + "/qmallstore/documentation" });
        });
        var middleware = function(req, res, next) {
            var secretkey = "e4577c7d0efb7cb7b0085f38256b13cab93415bd8222b384aaf3af03840d6326";
            var salt = bcrypt.genSaltSync(10);
            var hash = bcrypt.hashSync(secretkey, salt);
            if (bcrypt.compareSync(req.headers.api_key, hash)) {
                next();
            } else {
                res.sendStatus(403);
            }
        };
        app.use(middleware);
        app.use('/qmallstore', newsletter);
        app.use('/qmallstore', faq);
        app.use('/qmallstore', advertisement);
        app.use('/qmallstore', promo);
        app.use('/qmallstore', topSelling);
        app.use('/qmallstore', topViewing);
        app.use('/qmallstore', byCategory);
        app.use('/qmallstore', byPartNumber);
        app.use('/qmallstore', byBrand);
        app.use('/qmallstore', allProduct);
        app.use('/qmallstore', brandList);
        app.use('/qmallstore', categorybybrandList);
        app.use('/qmallstore', insertSubscribeEmail);
        app.use('/qmallstore', registercustomer);
        app.use('/qmallstore', province);
        app.use('/qmallstore', regency);
        app.use('/qmallstore', district);
        app.use('/qmallstore', village);
        app.use('/qmallstore', allBrandAllCategory);
        app.use('/qmallstore', personalInfo);
        app.use('/qmallstore', otpcode);
        app.use('/qmallstore', resendcode);
        app.use('/qmallstore', contactForm);
        app.use('/qmallstore', loginCustomer);
        app.use('/qmallstore', faqLike);
        app.use('/qmallstore', faqDislike);
        app.use('/qmallstore', faqWaitingList);
        app.use('/qmallstore', searchByBrand);
        app.use('/qmallstore', searchByPartNumber);
        app.use('/qmallstore', partNumberName);
        app.use('/qmallstore', emailForgotPassword);
        app.use('/qmallstore', resetPassword);
        app.use('/qmallstore', noLimit);
        app.use('/qmallstore', limit);
        app.use('/qmallstore', productInfo);
        app.use('/qmallstore', productInquiry);
        app.use('/qmallstore', cartAdd);
        app.use('/qmallstore', cartShow);
        app.use('/qmallstore', cartDelete);
        app.use('/qmallstore', orderProduct);
        app.use('/qmallstore', orderPayment);
        app.use('/qmallstore', orderShipment);
        app.use('/qmallstore', searchProduct);
    }
});