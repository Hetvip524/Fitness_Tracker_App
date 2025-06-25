// import 'package:flutter/material.dart';

// class WorkOutDetail extends StatefulWidget {
//   const WorkOutDetail({super.key});

//   @override
//   State<WorkOutDetail> createState() => _WorkOutDetailState();
// }

// class _WorkOutDetailState extends State<WorkOutDetail> {
//   List workArr=[
//     {
//       "name":"Running","image":"assets/Running.jpg",
//     },
//      {
// "name":"Jumping","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9raP8vgwPUaPaQ1z8T9hX9sYQHOpSIExarA&s",
//        },
//      {
// "name":"Running","image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN2JC4jggnEBbN7WUAb97jzi9ulpGy_58s_NmOVu8pDmskeyYRvTpQxeiq07Eam3B8qe8&usqp=CAU",
//        },
//      {
// "name":"Jumping","image":"https://wallpapers.com/images/hd/gym-motivation-workout-ds3fphdfnmdrzbu3.jpg",
//        }
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.sizeOf(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 1,
//         title: Text("Climber",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
//         //leading: Icon(Icons.arrow_back,color: Colors.black,),

//       ),
//       body: SingleChildScrollView(scrollDirection: Axis.vertical,
//         child: Column(
//           children: [

//                               Image.asset("assets/Running.jpg",
//                               height: media.width*0.5,width: media.width,
//                               fit: BoxFit.cover,),

//            // SizedBox(height: media.width* 0.3,
//              // child: L
//               ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: EdgeInsets.zero,
//                 itemCount: workArr.length,
//                 itemBuilder: (context,index){
//                   var wObj = workArr[index] as Map? ?? {};
//                   return Container(
//                  //   margin: EdgeInsets.symmetric(vertical: 10),
//                    // height: media.width*0.5,
//                    width: 100,
//                          decoration: BoxDecoration(
//                           color: Colors.white,
//                          ),
//                         // clipBehavior: Clip.antiAlias,
//                          child:
//                          // SingleChildScrollView(scrollDirection: Axis.vertical,
//                            // child:
//                              Column(
//                               children: [
//                                 Stack(alignment: Alignment.center,
//                                   children: [

//                                 Image.asset(wObj["image"].toString(),
//                                 height: media.width*0.2,width: media.width,
//                                 fit: BoxFit.cover,),

//                                   Container(
//                                 height: media.width*0.2,width: media.width,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white

//                                                 ),
//                                                 ),

//                                 ]),
//                                                 Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Row(
//                                   //crossAxisAlignment: CrossAxisAlignment.start,
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                             children: [
//                                    Text(wObj["name"],style: TextStyle(fontSize: 14,
//                                     color: Colors.red,fontWeight: FontWeight.w500),),

//                                     //   Text(wObj["name"],style: TextStyle(fontSize: 20,
//                                     // color: Colors.white,fontWeight: FontWeight.w700),),
//                                     //  Text(wObj["subtitle"],style: TextStyle(fontSize: 14,
//                                     // color: Colors.white,fontWeight: FontWeight.w500),),
//                                     // Spacer(),
//                                      Row(mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          InkWell(onTap: (){
//                                                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Stepview()),
//                                                            //  (route)=> false);
//                                                          },
//                                                            child: Container(height: 20,width: 80,decoration: BoxDecoration(
//                                                              borderRadius: BorderRadius.circular(15),
//                                                              color: Colors.orange,boxShadow: [BoxShadow(color: Colors.black,blurRadius: 1)]
//                                                            ),child: Center(child: Text("See More",style: TextStyle(color: Colors.white,
//                                                            fontSize: 12,fontWeight: FontWeight.w400),)),),
//                                                          ),],),
//                                                         IconButton(onPressed: (){

//                                                         }, icon:  Image.network("https://cdn-icons-png.flaticon.com/512/566/566021.png",
//                                                         width: 25,height: 25,),)
//                                                          ],),
//                                                          ),

//                                // ],),

//                                         Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  // crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                    Text(wObj["title"],style: TextStyle(fontSize: 14,
//                                     color: Colors.yellow,fontWeight: FontWeight.w500),),
//                                     //   Text(wObj["name"],style: TextStyle(fontSize: 20,
//                                     // color: Colors.white,fontWeight: FontWeight.w700),),
//                                     //  Text(wObj["subtitle"],style: TextStyle(fontSize: 14,
//                                     // color: Colors.white,fontWeight: FontWeight.w500),),
//                                     // Spacer(),
//                                     //  Row(mainAxisAlignment: MainAxisAlignment.end,
//                                     //    children: [
//                                     //      InkWell(onTap: (){
//                                     //                        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Stepview()),
//                                     //                        //  (route)=> false);
//                                     //                      },
//                                     //                        child: Container(height: 20,width: 80,decoration: BoxDecoration(
//                                     //                          borderRadius: BorderRadius.circular(15),
//                                     //                          color: Colors.orange,boxShadow: [BoxShadow(color: Colors.black,blurRadius: 1)]
//                                     //                        ),child: Center(child: Text("See More",style: TextStyle(color: Colors.white,
//                                     //                        fontSize: 12,fontWeight: FontWeight.w400),)),),
//                                     //                      ),],
//                                     //                      ),
//                                                          ],),
//                                                          ),

//                               ],
//                              ),

//                   );
//                 }

//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(elevation: 1,
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(onTap: (){

//             },
//             child: Image.asset("assets/Running.jpg",width: 25,height: 25,),
//             ),

//               InkWell(onTap: (){

//             },
//             child: Image.asset("assets/meal.jpg",width: 25,height: 25,),
//             ),

//               InkWell(onTap: (){

//             },
//             child: Image.asset("assets/home.jpg",width: 25,height: 25,),
//             ),

//               InkWell(onTap: (){

//             },
//             child: Image.asset("assets/weight.jpg",width: 25,height: 25,),
//             ),

//               InkWell(onTap: (){

//             },
//             child: Image.network("https://cdn-icons-png.flaticon.com/512/566/566021.png",
//             width: 25,height: 25,),
//             ),

//           ],),
//         ),
//       )
//     );
//   }
// }

// import 'package:fitness_app/view/commom_widget/response_row.dart';
// import 'package:fitness_app/view/exercise/exercise.dart';
// import 'package:fitness_app/view/home.dart';
// import 'package:fitness_app/view/meal_plan/mealplan.dart';
// import 'package:fitness_app/view/weight/weight.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class Yoga extends StatefulWidget {
//   const Yoga({super.key});

//   @override
//   State<Yoga> createState() => _YogaState();
// }

// class _YogaState extends State<Yoga> {
//   List workArr = [
//     {"name": "Running", "image": "assets/Running.jpg"},
//     {"name": "Jumping", "image": "assets/Running.jpg"},
//     {
//       "name": "Running",
//       "image": "assets/Running.jpg",
//     },
//     {
//       "name": "Jumping",
//       "image": "assets/Running.jpg",
//     },
//   ];

//   List responseArr = [
//     {
//       "name": "Mikhail Eduardovich",
//       "time": "09 days ago",
//       "image": "assets/Running.jpg" "assets/Running.jpg",
//       "message": "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit,"
//     },
//     {
//       "name": "Mikhail Eduardovich",
//       "time": "11 days ago",
//       "image": "assets/Running.jpg",
//       "message": "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit,"
//     },
//     {
//       "name": "Mikhail Eduardovich",
//       "time": "12 days ago",
//       "image": "assets/Running.jpg",
//       "message": "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit,"
//     },
//     {
//       "name": "Mikhail Eduardovich",
//       "time": "13 days ago",
//       "image": "assets/Running.jpg",
//       "message": "Lorem ipsum dolor sit amet, conse ctetur adipiscing elit,"
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.sizeOf(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange,
//         centerTitle: true,
//         elevation: 0.1,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back)),
//         title: Text(
//           "Yoga",
//           style: TextStyle(
//               color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Container(
//               height: 210,
//               width: double.infinity,
//               child: Image.network(
//                   "https://static.vecteezy.com/system/resources/thumbnails/043/974/898/small_2x/studio-shot-of-young-woman-practicing-yoga-isolated-yoga-concept-png.png"
//                   //,fit: BoxFit.cover,
//                   )),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.star,
//                   color: Colors.orange,
//                 ),
//                 Icon(
//                   Icons.star,
//                   color: Colors.orange,
//                 ),
//                 Icon(
//                   Icons.star,
//                   color: Colors.orange,
//                 ),
//                 Icon(
//                   Icons.star,
//                   color: Colors.orange,
//                 ),
//                 Icon(
//                   Icons.star,
//                   color: Colors.orange,
//                 ),
//                 const Spacer(),
//                 Icon(Icons.library_add_check_outlined),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Icon(Icons.share)
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(2),
//             child: Text(
//               "Tips",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700),
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//                 "Yoga is a practice that connects the body, breath, and mind. It uses physical postures, breathing exercises, and meditation to improve overall health. Yoga was developed as a spiritual practice thousands of years ago. Today, most Westerners who do yoga do it for exercise or to reduce stress.Yoga is a practice that connects the body, breath, and mind. It uses physical postures, breathing exercises, and meditation to improve overall health. Yoga was developed as a spiritual practice thousands of years ago. Today, most Westerners who do yoga do it for exercise or to reduce stress."),
//           )
//           //       SizedBox(
//           //         height: 20,
//           //        ),Padding(
//           //          padding: const EdgeInsets.all(8),
//           //          child: SingleChildScrollView(scrollDirection: Axis.horizontal,
//           //            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//           //             children: [
//           //                     Column(children: [
//           //                       Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
//           //                         height: 90,width: 150,
//           //                       child:Image.asset(
//           //                                "assets/Running.jpg",
//           //                               // width: media.width,
//           //                               // height: media.width * 0.15,
//           //                               fit: BoxFit.cover,
//           //                             ) ,),
//           //                             Text(
//           //                            "hello",
//           //                             style: TextStyle(
//           //                                 color: Colors.black,
//           //                                 fontSize: 10,
//           //                                 fontWeight: FontWeight.w700),
//           //                           ),
//           //                     ],),
//           //                     SizedBox(width: 10,),
//           //                     Column(children: [
//           //                       Container(height: 90,width: 150,
//           //                       child:Image.asset(
//           //                                "assets/Running.jpg",
//           //                               // width: media.width,
//           //                               // height: media.width * 0.15,
//           //                               fit: BoxFit.cover,
//           //                             ) ,),
//           //                             Text(
//           //                            "hello",
//           //                             style: TextStyle(
//           //                                 color: Colors.black,
//           //                                 fontSize: 10,
//           //                                 fontWeight: FontWeight.w700),
//           //                           ),
//           //                     ],),                          SizedBox(width: 10,),

//           //                     Column(children: [
//           //                       Container(height: 90,width: 150,
//           //                       child:Image.asset(
//           //                                "assets/Running.jpg",
//           //                               // width: media.width,
//           //                               // height: media.width * 0.15,
//           //                               fit: BoxFit.cover,
//           //                             ) ,),
//           //                             Text(
//           //                            "hello",
//           //                             style: TextStyle(
//           //                                 color: Colors.black,
//           //                                 fontSize: 10,
//           //                                 fontWeight: FontWeight.w700),
//           //                           ),
//           //                     ],),                          SizedBox(width: 10,),

//           //                     Column(children: [
//           //                       Container(height: 90,width: 150,
//           //                       child:Image.asset(
//           //                                "assets/Running.jpg",
//           //                               // width: media.width,
//           //                               // height: media.width * 0.15,
//           //                               fit: BoxFit.cover,
//           //                             ) ,),
//           //                             Text(
//           //                            "hello",
//           //                             style: TextStyle(
//           //                                 color: Colors.black,
//           //                                 fontSize: 10,
//           //                                 fontWeight: FontWeight.w700),
//           //                           ),
//           //                     ],),                          SizedBox(width: 10,),

//           //                     Column(children: [
//           //                       Container(height: 90,width: 150,
//           //                       child:Image.asset(
//           //                                "assets/Running.jpg",
//           //                               // width: media.width,
//           //                               // height: media.width * 0.15,
//           //                               fit: BoxFit.cover,
//           //                             ) ,),
//           //                             Text(
//           //                            "hello",
//           //                             style: TextStyle(
//           //                                 color: Colors.black,
//           //                                 fontSize: 10,
//           //                                 fontWeight: FontWeight.w700),
//           //                           ),
//           //                     ],)
//           //                   ],),
//           //          ),
//           //        ),

//           //               // Container(
//           //               //   margin: const EdgeInsets.symmetric(
//           //               //       vertical: 4, horizontal: 8),
//           //               //   width: 10,
//           //               //   child: Column(
//           //               //     crossAxisAlignment: CrossAxisAlignment.start,
//           //               //     children: [
//           //               //       Stack(
//           //               //         alignment: Alignment.center,
//           //               //         children: [
//           //               //           Image.asset(
//           //               //             wObj["image"].toString(),
//           //               //             width: media.width,
//           //               //             height: media.width * 0.15,
//           //               //             fit: BoxFit.cover,
//           //               //           ),
//           //               //           Container(
//           //               //             width: media.width,
//           //               //             height: media.width * 0.15,
//           //               //             decoration: BoxDecoration(
//           //               //                 color: Colors.white.withOpacity(0.5)),
//           //               //           ),
//           //               //         ],
//           //               //       ),
//           //               //       Padding(
//           //               //         padding: const EdgeInsets.all(10),
//           //               //         child: Text(
//           //               //           wObj["name"],
//           //               //           style: TextStyle(
//           //               //               color: Colors.black,
//           //               //               fontSize: 14,
//           //               //               fontWeight: FontWeight.w700),
//           //               //         ),
//           //               //       ),
//           //               //     ],
//           //               //   ),
//           //               // );
//           //       //       }),
//           //       // ),
//           //       Padding(
//           //         padding: const EdgeInsets.all(5),
//           //         child: Text(
//           //           "17 Responses",
//           //           style: TextStyle(
//           //               color: Colors.black,
//           //               fontSize: 18,
//           //               fontWeight: FontWeight.w700),
//           //         ),
//           //       ),
//           //       ListView.builder(
//           //         physics: const NeverScrollableScrollPhysics(),
//           //         padding: const EdgeInsets.all(10),
//           //         shrinkWrap: true,
//           //         itemCount: responseArr.length,
//           //         itemBuilder: ((context, index) {
//           //           var rObj = responseArr[index] as Map? ?? {};
//           //           return ResponsesRow(rObj: rObj,);
//           //         }),
//           //       )
//           //     ],
//         ]),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         elevation: 1,
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ExerciseView()));
//                   },
//                   child: Image.network(
//                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMClDPOuC1L0B_NldaPd3jdFSeZqTW6_ElAKTLHhy5wMVNRzRkOoFrEePwg_o-Sjc2Wkk&usqp=CAU",
//                       width: 55,
//                       height: 25),
//                 ),
//                 SizedBox(
//                   width: 50,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => MealPlanView()));
//                   },
//                   child: Image.network(
//                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPFcxkoYBQpIjIyobSbcCA36XMBY3HbS1suw&s",
//                     width: 55,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 50,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Home()));
//                   },
//                   child: Image.network(
//                     "https://static.vecteezy.com/system/resources/previews/009/589/471/non_2x/home-icon-transparent-free-png.png",
//                     width: 55,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 50,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Weight()));
//                   },
//                   child: Image.network(
//                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDb_C9Qk_Uy1j37Opy4IehLpRrD16y60HGAQ&s",
//                     width: 45,
//                     height: 25,
//                   ),
//                 ),
//                 // SizedBox(
//                 //   width: 70,
//                 // ),
//                 // InkWell(
//                 //   onTap: () {},
//                 //   child:
//                 //       Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw24IyPNoSog1zjqDtDDlM4M0OiKfikegQXw&s",
//                 //        width: 55, height: 25),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
