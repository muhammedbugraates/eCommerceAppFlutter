import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetails(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImages(),
              _buildProductTitle(),
              SizedBox(
                height: 12.0,
              ),
              _buildProductPrice(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(screenSize),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(screenSize),
              SizedBox(
                height: 12.0,
              ),
              _buildSizeArea(),
              SizedBox(
                height: 12.0,
              ),
              _buildInfo(),
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                TabBarView(
                  controller: imagesController,
                  children: [
                    Image.network(
                        "https://kizlarvemoda.com/wp-content/uploads/2014/12/yeni-yil-2015-orgu-kazak-fotograflari.jpg"),
                    Image.network(
                        "https://www.fotografindir.net/wp-content/uploads/2017/04/karizma-erkek-kazaklar.jpg"),
                    Image.network(
                        "https://www.orgugaleri.com/wp-content/uploads/2019/04/gen%C3%A7-k%C4%B1z-%C3%B6rg%C3%BCleri-%C3%B6rg%C3%BC-kazak-modelleri-resimleri.jpg"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                    controller: imagesController,
                    color: Colors.grey,
                    selectedColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          "Jack Jones Kazak",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Text("\$100", style: TextStyle(fontSize: 16.0, color: Colors.black)),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$200",
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text("\%100 indirim",
              style: TextStyle(fontSize: 12.0, color: Colors.blue)),
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.local_offer,
            color: Colors.grey,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Daha fazla bilgi için tıklayınız.",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.straighten,
                color: Colors.grey,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Beden",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "Beden Tablosu",
                style: TextStyle(fontSize: 12.0, color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildInfo() {
    TabController controller = TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        children: [
          TabBar(
            controller: controller,
            tabs: [
              Tab(
                child: Text(
                  "Ürün Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Ürün Bilgisi",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 12.0, top: 6.0),
            height: 100.0,
            child: TabBarView(
              controller: controller,
              children: [
                Text(
                  "%60 Pamuk, %30 Polyester",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "30 derece makinada renkli yıkama",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.list,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "İstek",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_travel,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    "Sepete Ekle",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
