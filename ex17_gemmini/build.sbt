// See README.md for license details.

name := "gemmini"

version := "3.1.0"

scalaVersion := "2.12.10"
scalacOptions += "-Xsource:2.11"

addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full)
scalacOptions += "-Xplugin-require:macroparadise"
 /*
libraryDependencies ++= Seq(
  "edu.berkeley.cs" %% "chisel3" % "3.5.6",
  "edu.berkeley.cs" %% "rocketchip" % "1.2.6",
  "edu.berkeley.cs" %% "chisel-iotesters" % "2.5.6",
  "org.scalanlp" %% "breeze" % "1.1",
  "edu.berkeley.cs" %% "chiseltest" % "0.5.1" % "test"
  )
  */

libraryDependencies ++= Seq(
  "edu.berkeley.cs" %% "chisel3" % "3.5.+",
  "edu.berkeley.cs" %% "rocketchip" % "1.2.6" exclude("edu.berkeley.cs", "chisel3_2.12"),
  "edu.berkeley.cs" %% "chisel-iotesters" % "2.5.6",
  "org.scalanlp" %% "breeze" % "1.1",
  "edu.berkeley.cs" %% "chiseltest" % "0.5.1" % "test"
)

//libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.+"

resolvers ++= Seq(
  Resolver.sonatypeRepo("snapshots"),
  Resolver.sonatypeRepo("releases"),
  Resolver.mavenLocal)


