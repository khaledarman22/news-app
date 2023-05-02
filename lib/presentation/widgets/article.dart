import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news/constants/images.dart';
import 'package:news/constants/strings.dart';

import '../screens/web_view.dart';

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) =>  Divider(
      thickness: 1.5,
      color: Colors.blueGrey.shade100,
      endIndent: MediaQuery.of(context).size.width/14,
      indent: MediaQuery.of(context).size.width/12,
    ),
    itemCount:list.length,
  ),
  fallback: (context) =>
  isSearch ? Container() :  Center(child: Image.asset(MyImages.loadingImg,height: MediaQuery.of(context).size.height/4,width: MediaQuery.of(context).size.width/2,)),
);

Widget buildArticleItem(article, context) => InkWell(
  splashColor: Colors.blueGrey.shade500,
  highlightColor: Colors.blueGrey.shade100,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>WebViewScreen( url: article[MyStrings.articleUrl],),
      ),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        if(article[MyStrings.articleUrlImage] != null)  Container(
          width:MediaQuery.of(context).size.width/3.3,
          height: MediaQuery.of(context).size.height/7,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: FadeInImage(
            fit: BoxFit.cover,
              placeholder: const AssetImage(MyImages.loadingImg),
              image:  NetworkImage('${article[MyStrings.articleUrlImage]}'),
          ),
        ),
        if(article[MyStrings.articleUrlImage] ==null)  Container(
          width:MediaQuery.of(context).size.width/3,
          height: MediaQuery.of(context).size.height/7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            image:const DecorationImage(
              image: AssetImage(MyImages.nullImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
         SizedBox(
          width: MediaQuery.of(context).size.width/25,
        ),
        Expanded(
          child: SizedBox(
            height:MediaQuery.of(context).size.height/7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article[MyStrings.articleTitle]}',
                    style:  TextStyle(
                      fontSize: MediaQuery.of(context).size.width/23,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            if(article[MyStrings.articleSource] !=null)
              Text(
                  '${article[MyStrings.articleSource][MyStrings.articleSourceName]}',
                  maxLines: 1,
                  style:  TextStyle(
                    fontSize: MediaQuery.of(context).size.width/28,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700,
                  ),
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height/70,
          ),
          Text(
            article[MyStrings.articleTime].toString().substring(0,10),
            style:    TextStyle(
              fontSize: MediaQuery.of(context).size.width/30,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade500,
            ),
          ),
              ],
            ),
          ),
        ),

      ],
    ),
  ),
);
