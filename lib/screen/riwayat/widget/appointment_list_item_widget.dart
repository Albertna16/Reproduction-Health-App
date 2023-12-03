import 'package:flutter/material.dart';

import 'package:reprohealth_app/theme/theme.dart';
import 'package:reprohealth_app/models/riwayat_models/riwayat_models.dart';

class AppointmentListItemWidget extends StatelessWidget {
  const AppointmentListItemWidget({
    super.key,
    required this.appointmentData,
    required this.visibleStatusContainer,
    required this.onPressed,
  });

  final Transaction appointmentData;
  final bool visibleStatusContainer;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    int indexDoctor = 0;
    var doctorData = appointmentData.doctor?[indexDoctor];

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(12),
      color: grey10,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //^ Foto Dokter
              ClipOval(
                child: Image.network(
                  doctorData?.avatar ??
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                  fit: BoxFit.cover,
                  height: 45,
                  width: 45,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //^ Nama Dokter
                  Text(
                    doctorData?.name ?? "-",
                    style: semiBold14Grey500,
                  ),

                  //^ Spesialis
                  Text(
                    doctorData?.specialist ?? "-",
                    style: regular12Grey200,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //^ Nomer Urut
                  Text(
                    "Nomer Urut ${appointmentData.queueNumber ?? '-'}",
                    style: semiBold12Green500,
                  ),

                  //^ Container paymentStatus Pembayaran
                  Visibility(
                    visible: visibleStatusContainer,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: () {
                          if (appointmentData.paymentStatus == 'Berhasil') {
                            return positive25;
                          } else if (appointmentData.paymentStatus ==
                              'Tertunda') {
                            return warning25;
                          } else {
                            return negative25;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        () {
                          if (appointmentData.paymentStatus == "Berhasil") {
                            return "Selesai";
                          } else {
                            return appointmentData.paymentStatus ?? '-';
                          }
                        }(),
                        style: () {
                          if (appointmentData.paymentStatus == 'Berhasil') {
                            return semiBold10Positive;
                          } else if (appointmentData.paymentStatus ==
                              'Tertunda') {
                            return semiBold10Warning;
                          } else {
                            return semiBold10Negative;
                          }
                        }(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              //^ Klinik
              Text(
                appointmentData.clinic ?? "-",
                style: medium14Grey500,
              ),
              const SizedBox(height: 12),

              //^ Lokasi
              Text(
                appointmentData.location ?? "-",
                style: medium14Grey300,
              ),
              const SizedBox(height: 12),

              //^ Jadwal & Sesi
              Text(
                "${appointmentData.appointmentDate ?? '-'} - ${appointmentData.session ?? '-'}",
                style: medium14Grey300,
              ),
            ],
          ),
          const SizedBox(height: 12),

          //^ BUTTON LIHAT RINCIAN
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  width: 1.5,
                  color: positive,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Lihat Rincian",
                  style: semiBold12Green500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}