import 'package:flutter/material.dart';

import '../../modules/web_view/web_view_screen.dart';

Widget defaultList({var list, bool isSearch = false,required BuildContext context}) {
  return list!.isNotEmpty
      ? InkWell(
        onTap: (){
          navigateTo(context: context,screen:WebViewScreen(list['url']));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${list['urlToImage']}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 120.0,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${list['title']}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                        '${list['publishedAt']}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      : Center(
          child: isSearch ? Container() : const CircularProgressIndicator(),
        );
}

void navigateTo({context,screen}){
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => screen));
}