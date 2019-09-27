unit Tiny.Rtti;

{******************************************************************************}
{ Copyright (c) 2019 Dmitry Mozulyov                                           }
{                                                                              }
{ Permission is hereby granted, free of charge, to any person obtaining a copy }
{ of this software and associated documentation files (the "Software"), to deal}
{ in the Software without restriction, including without limitation the rights }
{ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell    }
{ copies of the Software, and to permit persons to whom the Software is        }
{ furnished to do so, subject to the following conditions:                     }
{                                                                              }
{ The above copyright notice and this permission notice shall be included in   }
{ all copies or substantial portions of the Software.                          }
{                                                                              }
{ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR   }
{ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,     }
{ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  }
{ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER       }
{ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,}
{ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN    }
{ THE SOFTWARE.                                                                }
{                                                                              }
{ email: softforyou@inbox.ru                                                   }
{ skype: dimandevil                                                            }
{ repository: https://github.com/d-mozulyov/Tiny.Rtti                          }
{******************************************************************************}

// compiler directives
{$ifdef FPC}
  {$MODE DELPHIUNICODE}
  {$ASMMODE INTEL}
  {$define INLINESUPPORT}
  {$define INLINESUPPORTSIMPLE}
  {$define OPERATORSUPPORT}
  {$define ANSISTRSUPPORT}
  {$define SHORTSTRSUPPORT}
  {$define WIDESTRSUPPORT}
  {$ifdef MSWINDOWS}
    {$define WIDESTRLENSHIFT}
  {$endif}
  {$define INTERNALCODEPAGE}
  {$ifdef CPU386}
    {$define CPUX86}
  {$endif}
  {$ifdef CPUX86_64}
    {$define CPUX64}
  {$endif}
  {$if Defined(CPUARM) or Defined(UNIX)}
    {$define POSIX}
  {$ifend}
{$else}
  {$if CompilerVersion >= 24}
    {$LEGACYIFEND ON}
  {$ifend}
  {$if CompilerVersion >= 15}
    {$WARN UNSAFE_CODE OFF}
    {$WARN UNSAFE_TYPE OFF}
    {$WARN UNSAFE_CAST OFF}
  {$ifend}
  {$if CompilerVersion >= 20}
    {$define INLINESUPPORT}
  {$ifend}
  {$if CompilerVersion >= 17}
    {$define INLINESUPPORTSIMPLE}
  {$ifend}
  {$if CompilerVersion >= 18}
    {$define OPERATORSUPPORT}
  {$ifend}
  {$if CompilerVersion < 23}
    {$define CPUX86}
  {$else}
    {$define UNITSCOPENAMES}
  {$ifend}
  {$if CompilerVersion >= 21}
    {$WEAKLINKRTTI ON}
    {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
  {$ifend}
  {$if (not Defined(NEXTGEN)) or (CompilerVersion >= 31)}
    {$define ANSISTRSUPPORT}
  {$ifend}
  {$ifNdef NEXTGEN}
    {$define SHORTSTRSUPPORT}
  {$endif}
  {$if Defined(MSWINDOWS) or (Defined(MACOS) and not Defined(IOS))}
    {$define WIDESTRSUPPORT}
  {$ifend}
  {$if Defined(MSWINDOWS) or (Defined(WIDESTRSUPPORT) and (CompilerVersion <= 21))}
    {$define WIDESTRLENSHIFT}
  {$ifend}
  {$if Defined(ANSISTRSUPPORT) and (CompilerVersion >= 20)}
    {$define INTERNALCODEPAGE}
  {$ifend}
{$endif}
{$U-}{$V+}{$B-}{$X+}{$T+}{$P+}{$H+}{$J-}{$Z1}{$A4}
{$O+}{$R-}{$I-}{$Q-}{$W-}
{$ifdef CPUX86}
  {$if not Defined(NEXTGEN)}
    {$define CPUX86ASM}
    {$define CPUINTELASM}
  {$ifend}
  {$define CPUINTEL}
{$endif}
{$ifdef CPUX64}
  {$if (not Defined(POSIX)) or Defined(FPC)}
    {$define CPUX64ASM}
    {$define CPUINTELASM}
  {$ifend}
  {$define CPUINTEL}
{$endif}
{$if Defined(CPUX64) or Defined(CPUARM64)}
  {$define LARGEINT}
{$else}
  {$define SMALLINT}
{$ifend}
{$ifdef KOL_MCK}
  {$define KOL}
{$endif}

interface

implementation

end.
