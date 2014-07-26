import math, complex, strutils

proc rect(r, phi): TComplex = (r * cos(phi), sin(phi))
proc phase(c): float = arctan2(c.im, c.re)

proc radians(x): float = (x * pi) / 180.0
proc degrees(x): float = (x * 180.0) / pi

proc meanAngle(deg): float =
  var c: TComplex
  for d in deg:
    c += rect(1.0, radians(d))
  degrees(phase(c / float(deg.len)))

proc meanTime(times): string =
  const day = 24 * 60 * 60
  let
    angles = times.map(proc(time: string): float =
      let t = time.split(":")
      (t[2].parseInt + t[1].parseInt * 60 + t[0].parseInt * 3600) * 360 / day)
    ms = (angles.meanAngle * day / 360 + day) mod day
    (h,m,s) = (ms.int div 3600, (ms.int mod 3600) div 60, ms.int mod 60)

  align($h, 2, '0') &":"& align($m, 2, '0') &":"& align($s, 2, '0')

echo meanTime(["23:00:17", "23:40:20", "00:12:45", "00:17:19"])
